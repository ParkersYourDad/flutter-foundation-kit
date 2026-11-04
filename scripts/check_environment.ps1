# Read-only Flutter Foundation Kit environment report.
# Compatible with Windows PowerShell 5.1 and PowerShell 7.
# Does not install, update, write files, or change machine configuration.

[CmdletBinding()]
param()

$ErrorActionPreference = 'Continue'
$ProgressPreference = 'SilentlyContinue'

function Write-Section {
    param([Parameter(Mandatory = $true)][string]$Title)
    Write-Host ''
    Write-Host ('=' * 72) -ForegroundColor DarkGray
    Write-Host $Title -ForegroundColor Cyan
    Write-Host ('=' * 72) -ForegroundColor DarkGray
}

function Write-CommandInfo {
    param(
        [Parameter(Mandatory = $true)][string]$Name,
        [string[]]$Arguments = @('--version')
    )

    $command = Get-Command -Name $Name -ErrorAction SilentlyContinue |
        Where-Object { $_.CommandType -eq 'Application' } |
        Select-Object -First 1

    if (-not $command) {
        Write-Host "$Name : NOT FOUND" -ForegroundColor Yellow
        return
    }

    Write-Host "$Name : $($command.Source)" -ForegroundColor Gray
    try {
        $output = & $command.Source @Arguments 2>&1
        foreach ($line in $output) {
            Write-Host "  $line"
        }
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  Exit code: $LASTEXITCODE" -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "  Could not run: $($_.Exception.Message)" -ForegroundColor Yellow
    }
}

Write-Section 'HOST'
Write-Host "OS: $([System.Environment]::OSVersion.VersionString)"
Write-Host "PowerShell: $($PSVersionTable.PSVersion)"
Write-Host "64-bit process: $([Environment]::Is64BitProcess)"
Write-Host "Working directory: $(Get-Location)"

Write-Section 'FLUTTER'
$flutterCommand = Get-Command -Name 'flutter' -ErrorAction SilentlyContinue |
    Where-Object { $_.CommandType -eq 'Application' } |
    Select-Object -First 1

if ($flutterCommand) {
    Write-Host "Flutter path: $($flutterCommand.Source)"
    try {
        $machineOutput = & $flutterCommand.Source --version --machine 2>$null
        $machineText = ($machineOutput | Out-String).Trim()
        if ($machineText) {
            try {
                $version = $machineText | ConvertFrom-Json
                Write-Host "Flutter version: $($version.frameworkVersion)"
                Write-Host "Flutter channel: $($version.channel)"
                Write-Host "Dart bundled version: $($version.dartSdkVersion)"
                Write-Host "Flutter framework revision: $($version.frameworkRevision)"
                Write-Host "Flutter engine revision: $($version.engineRevision)"
            }
            catch {
                Write-Host 'Could not parse Flutter machine version output:' -ForegroundColor Yellow
                Write-Host $machineText
            }
        }
    }
    catch {
        Write-Host "Flutter version command failed: $($_.Exception.Message)" -ForegroundColor Yellow
    }

    Write-Host ''
    Write-Host 'flutter doctor -v (review Android section; missing Xcode on Windows is expected):' -ForegroundColor Gray
    & $flutterCommand.Source doctor -v
    Write-Host "flutter doctor exit code: $LASTEXITCODE"
}
else {
    Write-Host 'Flutter SDK is not on PATH.' -ForegroundColor Red
}

Write-Section 'JAVA AND ANDROID TOOLS'
Write-Host "JAVA_HOME: $env:JAVA_HOME"
Write-Host "ANDROID_HOME: $env:ANDROID_HOME"
Write-Host "ANDROID_SDK_ROOT: $env:ANDROID_SDK_ROOT"

foreach ($variableName in @('JAVA_HOME', 'ANDROID_HOME', 'ANDROID_SDK_ROOT')) {
    $value = [Environment]::GetEnvironmentVariable($variableName)
    if ($value) {
        Write-Host "$variableName exists: $(Test-Path -LiteralPath $value)"
    }
}

Write-CommandInfo -Name 'java' -Arguments @('-version')
Write-CommandInfo -Name 'adb' -Arguments @('version')
Write-CommandInfo -Name 'sdkmanager' -Arguments @('--version')
Write-CommandInfo -Name 'git' -Arguments @('--version')

Write-Section 'IOS HOST CHECK'
if ($IsMacOS -or $env:OS -eq 'Darwin') {
    Write-CommandInfo -Name 'xcodebuild' -Arguments @('-version')
}
else {
    Write-Host 'This is not macOS. Local Xcode/iOS builds are unavailable here; iOS checks run on macOS CI.' -ForegroundColor Yellow
}

Write-Section 'END'
Write-Host 'Report complete. This script did not change your machine or write any files.' -ForegroundColor Green
Write-Host 'Share the full terminal output to complete the local environment verification.'
