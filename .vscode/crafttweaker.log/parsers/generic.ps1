function Invoke-GenericParser {
    param($line, $lineNumber, $logFilePath)

    if (-not ($line -match '\[(FATAL|ERROR|WARNING)\]')) { return $null }

    $logLevel = $matches[1]
    $severity = if ($logLevel -eq 'WARNING') { 'warning' } else { 'error' }
    $finalMessage = $line.Trim()

    # Use a robust regex to strip all [bracketed] prefixes
    $prefixRegex = '^(\s*\[[^\]]+\]\s*)+'
    $cleanMessage = $finalMessage -replace $prefixRegex, ''

    # For old error formats, a better message might be after the last colon
    $lastColonIndex = $cleanMessage.LastIndexOf(':')
    if ($lastColonIndex -ne -1) {
        $finalMessage = $cleanMessage.Substring($lastColonIndex + 1).Trim()
    } else {
        $finalMessage = $cleanMessage
    }

    if ([string]::IsNullOrWhiteSpace($finalMessage)) { $finalMessage = $line.Trim() }

    $problemString = "${logFilePath}:${lineNumber}:1: ${severity}: ${finalMessage}"
    return [pscustomobject]@{
        ProblemString = $problemString
        LinesToSkip = 0
    }
}
