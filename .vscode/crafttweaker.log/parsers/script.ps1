function Invoke-ScriptParser {
    param($logLines, $currentIndex, $workspaceRoot)

    $scriptsDir = Join-Path $workspaceRoot "scripts"
    $line = $logLines[$currentIndex]

    if (-not ($line -match '\[(FATAL|ERROR)\]')) { return $null }
    
    $severity = 'error'
    $foundSpecifics = $false
    
    $finalFilePath = $null
    $finalLineNum = $null
    $finalMessage = $line.Trim()
    $linesToSkip = 0

    # Strategy 1: Lookahead for stack trace (e.g., for some FATAL errors)
    $potentialMessage = $null
    for ($j = 1; $j -le 5; $j++) {
        if (($currentIndex + $j) -lt $logLines.Length) {
            $nextLine = $logLines[$currentIndex + $j].Trim()
            if ($nextLine -match '^(java\.|sun\.|com\.sun\.).*?(Exception|Error)(:.*)?$') { $potentialMessage = $nextLine }
            if ($nextLine -match '__script__\((.*?\.zs):(\d+)\)') {
                $finalFilePath = Join-Path $scriptsDir $matches[1]
                $finalLineNum = $matches[2]
                if ($potentialMessage) { $finalMessage = $potentialMessage }
                $linesToSkip = $j
                $foundSpecifics = $true
                break
            }
        }
    }

    # Strategy 2: Look on the same line
    if (-not $foundSpecifics) {
        if ($line -match '(?:.*\s)?(.*?\.zs):(\d+)\s*>\s*(.*)') {
            $finalFilePath = Join-Path $scriptsDir $matches[1]
            $finalLineNum = $matches[2]
            $finalMessage = $matches[3].Trim()
            $foundSpecifics = $true
        }
    }

    if ($foundSpecifics) {
        $problemString = "${finalFilePath}:${finalLineNum}:1: ${severity}: ${finalMessage}"
        return [pscustomobject]@{
            ProblemString = $problemString
            LinesToSkip = $linesToSkip
        }
    }

    return $null
}
