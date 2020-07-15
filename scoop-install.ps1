#!pwsh

param(
    [switch]$Private
)

$Buckets = @(
    "extras"
)
# TODO: 無いツールどうするか考える（ある bucket を探すか自前 bucket を作る）
$Packages = @(
    "7zip"
    # "adobereader"
    "azure-cli"
    # "chocolatey"
    # "ctrl2cap"
    "cubepdf"
    "cubepdfutility"
    "docker"
    "git"
    "go"
    "googlechrome"
    "ilspy"
    "linqpad"
    "nodejs-lts"
    "pwsh"
    "powertoys"
    "screentogif"
    "slack"
    "vscode"
    # "visualstudio2019buildtools"
    "winmerge"
    "zoom"
)
$PackagesForPrivate = @(
    "coretemp"
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
