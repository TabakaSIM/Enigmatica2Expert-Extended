# Helper function to parse Java's internal type signatures into a readable list.
# THIS IS NO LONGER USED due to an environmental bug, but kept for reference.
function Format-Signature-UNUSED {
    param($signatureString)
    $types = @()
    $matches = [regex]::Matches($signatureString, '(\[*)L([^;]+);')
    foreach ($match in $matches) {
        $isArray = $match.Groups[1].Value.Length -gt 0
        $className = $match.Groups[2].Value.Split('/')[-1]
        if ($isArray) { $types += "${className}[]" } else { $types += $className }
    }
    return [string]::Join(', ', $types)
}

function Invoke-MixinParser {
    param($logLines, $currentIndex, $workspaceRoot)

    $line = $logLines[$currentIndex]; if (($currentIndex + 1) -ge $logLines.Length) { return $null }; $nextLine = $logLines[$currentIndex + 1]
    if (-not ($line -match '\[FATAL\].*Error occurred when applying mixin')) { return $null }

    $mixinClassMatch = [regex]::Match($line, 'Error occurred when applying mixin (\w+)');
    if (-not $mixinClassMatch.Success) { return $null }
    $mixinClassName = $mixinClassMatch.Groups[1].Value

    $methodMatch = [regex]::Match($nextLine, '->@Inject::(\w+)'); if (-not $methodMatch.Success) { $methodMatch = [regex]::Match($nextLine, 'annotation on (\w+)') }
    if (-not $methodMatch.Success) { return $null }
    $methodName = $methodMatch.Groups[1].Value
    
    $searchPaths = @((Join-Path $workspaceRoot "scripts/mixin"), (Join-Path $workspaceRoot "scripts")); $targetFile = $null
    foreach ($path in $searchPaths) {
        $files = Get-ChildItem -Path $path -Filter "*.zs" -Recurse -ErrorAction SilentlyContinue
        foreach ($file in $files) { if (Select-String -Path $file.FullName -Pattern "zenClass\s+$mixinClassName" -Quiet) { $targetFile = $file; break } }
        if ($targetFile) { break }
    }
    if (-not $targetFile) { return $null }
    
    $fileContent = Get-Content -Path $targetFile.FullName; $classLineIndex, $funcLineIndex = -1, -1
    for ($i = 0; $i -lt $fileContent.Length; $i++) {
        if ($classLineIndex -eq -1 -and $fileContent[$i] -match "zenClass\s+$mixinClassName") { $classLineIndex = $i }
        if ($classLineIndex -ne -1 -and $fileContent[$i] -match "function\s+$methodName\s*\(") { if ($fileContent[$i] -match "zenClass\s+" -and $i -gt $classLineIndex) { $classLineIndex = -1; continue }; $funcLineIndex = $i; break }
    }
    if ($funcLineIndex -eq -1) { return $null }

    for ($i = $funcLineIndex - 1; $i -ge 0; $i--) {
        if ($fileContent[$i] -match "#mixin\s+Inject") {
            $filePath = $targetFile.FullName; $lineNumber = $i + 1; $errorMessage = $nextLine.Trim()

            # --- Final "Brute Force" message cleaning ---
            $descriptorMatch = [regex]::Match($errorMessage, '->@Inject::(\w+)\(.*\)V!\s*Expected \((.*?)\)V but found \((.*?)\)V')
            if ($descriptorMatch.Success) {
                $funcName = $descriptorMatch.Groups[1].Value
                
                # --- Format Expected Sig (In-line) ---
                $expectedTypes = @()
                $sigMatches = [regex]::Matches($descriptorMatch.Groups[2].Value, '(\[*)L([^;]+);')
                foreach ($match in $sigMatches) {
                    if ($match.Groups[1].Value.Length -gt 0) { $expectedTypes += "$($match.Groups[2].Value.Split('/')[-1])[]" } else { $expectedTypes += $match.Groups[2].Value.Split('/')[-1] }
                }
                $expectedSig = [string]::Join(', ', $expectedTypes)

                # --- Format Found Sig (In-line) ---
                $foundTypes = @()
                $sigMatches = [regex]::Matches($descriptorMatch.Groups[3].Value, '(\[*)L([^;]+);')
                foreach ($match in $sigMatches) {
                    if ($match.Groups[1].Value.Length -gt 0) { $foundTypes += "$($match.Groups[2].Value.Split('/')[-1])[]" } else { $foundTypes += $match.Groups[2].Value.Split('/')[-1] }
                }
                $foundSig = [string]::Join(', ', $foundTypes)

                $errorMessage = "Expected $funcName($expectedSig) but found $funcName($foundSig)"
            } else {
                # Fallback for other formats
                $exceptionMatch = [regex]::Match($errorMessage, ':(.*)'); if ($exceptionMatch.Success) { $errorMessage = $exceptionMatch.Groups[1].Value.Trim() }
                $refmapMatch = [regex]::Match($errorMessage, '(.*?)\s*\. Using refmap'); if ($refmapMatch.Success) { $errorMessage = $refmapMatch.Groups[1].Value }
            }

            $problemString = "${filePath}:${lineNumber}:1: error: ${errorMessage}"
            return [pscustomobject]@{ ProblemString = $problemString; LinesToSkip = 1 }
        }
        if ($i -le $classLineIndex) { break }
    }
    return $null
}
