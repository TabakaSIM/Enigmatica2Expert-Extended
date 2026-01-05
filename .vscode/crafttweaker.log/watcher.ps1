<#
.SYNOPSIS
    Main script to parse crafttweaker.log for errors and warnings. This script
    orchestrates calling modularized parsers for different error types.
#>
param(
    [string]$workspaceRoot,
    [switch]$Test
)

$logFilePath = Join-Path $workspaceRoot "crafttweaker.log"
$parsersDir = Join-Path $PSScriptRoot "parsers"

# Import parser functions
. (Join-Path $parsersDir "mixin.ps1")
. (Join-Path $parsersDir "script.ps1")
. (Join-Path $parsersDir "generic.ps1")

function Parse-Log {
    if (-not $Test.IsPresent) { Write-Host "CRAFTTWEAKER_LOG_SCAN_START" }
    if (Test-Path $logFilePath) {
        try {
            $logLines = Get-Content -Path $logFilePath
            for ($i = 0; $i -lt $logLines.Length; $i++) {
                $line = $logLines[$i]
                $result = $null

                # Try each parser in order of specificity
                $result = Invoke-MixinParser -logLines $logLines -currentIndex $i -workspaceRoot $workspaceRoot
                if (-not $result) {
                    $result = Invoke-ScriptParser -logLines $logLines -currentIndex $i -workspaceRoot $workspaceRoot
                }
                if (-not $result) {
                    $result = Invoke-GenericParser -line $line -lineNumber ($i + 1) -logFilePath $logFilePath
                }

                if ($result -and $result.ProblemString) {
                    Write-Host $result.ProblemString
                    $i += $result.LinesToSkip
                }
            }
        } catch { Write-Error "Error parsing log file: $_" }
    }
    if (-not $Test.IsPresent) { Write-Host "CRAFTTWEAKER_LOG_SCAN_END" }
}

Parse-Log

if (-not $Test.IsPresent) {
    Write-Host "Initializing CraftTweaker log watcher..."
    $watcher = New-Object System.IO.FileSystemWatcher; $watcher.Path = $workspaceRoot; $watcher.Filter = "crafttweaker.log"; $watcher.NotifyFilter = [System.IO.NotifyFilters]'LastWrite, FileName'
    $timer = New-Object System.Timers.Timer; $timer.Interval = 500; $timer.AutoReset = $false
    $watcherAction = { $timer.Stop(); $timer.Start() }
    $timerAction = { try { Parse-Log } catch { Write-Error "Error during debounced log parsing: $_" } }
    Register-ObjectEvent -InputObject $watcher -EventName "Changed" -Action $watcherAction
    Register-ObjectEvent -InputObject $watcher -EventName "Created" -Action $watcherAction
    Register-ObjectEvent -InputObject $watcher -EventName "Renamed" -Action $watcherAction
    Register-ObjectEvent -InputObject $timer   -EventName "Elapsed" -Action $timerAction
    Write-Host "Watcher is running..."; while ($true) { Wait-Event -Timeout 5 }
}
