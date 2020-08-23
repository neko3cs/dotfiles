#!pwsh

param(
    [ValidateSet("Community", "Professional", "Enterprise")]
    [string]$Edition = "Community"
)

[string]$vsInstallerName
switch ($Edition) {
    "Community" { $vsInstallerName = "vs_community.exe" }
    "Professional" { $vsInstallerName = "vs_professional.exe" }
    "Enterprise" { $vsInstallerName = "vs_enterprise.exe" }
}

if ((vswhere -utf8 -format json | ConvertFrom-Json).Length -eq 0) {
    Write-Host `
        "Install Visual Studio ${Edition}...`n" `
        -ForegroundColor Green
    Invoke-WebRequest `
        -Uri http://aka.ms/vs/16/release/$vsInstallerName `
        -UseBasicParsing `
        -OutFile $vsInstallerName
    Start-Process `
        -FilePath $vsInstallerName `
        -ArgumentList "--config `"${PWD}\.vsconfig`" --passive --norestart --wait" `
        -Verb runas `
        -Wait
    Remove-Item `
        -Path $vsInstallerName
}
else {
    Write-Host `
        "Update Visual Studio ${Edition}...`n" `
        -ForegroundColor Green
    Invoke-WebRequest `
        -Uri http://aka.ms/vs/16/release/$vsInstallerName `
        -UseBasicParsing `
        -OutFile $vsInstallerName
    Start-Process `
        -FilePath $vsInstallerName `
        -ArgumentList "update --passive --norestart --wait" `
        -Verb runas `
        -Wait
    Remove-Item `
        -Path $vsInstallerName
}
