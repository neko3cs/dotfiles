#!pwsh

param(
    [switch]$Private
)

$Buckets = @(
    "extras"
)
$Packages = @(
    "7zip"
    "azure-cli"
    # "ctrl2cap"
    # "cubepdf"
    "git"
    "go"
    "googlechrome"
    "gsudo"
    "ilspy"
    "linqpad"
    "nodejs-lts"
    "pwsh"
    "powertoys"
    "screentogif"
    "slack"
    "vscode"
    "vswhere"
    "winmerge"
    "zoom"
)
$PackagesForPrivate = @(
    "cpu-z"
    "discord"
)

if (!(Get-Command scoop -ea SilentlyContinue)) {
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

foreach ($bucket in $Buckets) {
    scoop bucket add $bucket
}

foreach ($package in $Packages) {
    scoop install $package
}

if ($Private) {
    foreach ($package in $PackagesForPrivate) {
        scoop install $package
    }
}
