param (
    # The programs to install
    [String[]]
    $Install,
    # The features to enable
    [String[]]
    $Enable,
    # If all of the programs should be installed
    [switch]
    $InstallAll = $false,
    # If all of the features should be installed
    [switch]
    $EnableAll = $false
)

# Start by importing the custom modules
Import-Module -Force ".\Modules\Invoke-Everything.psm1"
Import-Module -Force ".\Modules\Start-Installation.psm1"
Import-Module -Force ".\Modules\Start-Script.psm1"

# Either install everything
if ($InstallAll) {
    Get-ChildItem ".\Software\*.ps1" | ForEach-Object {
        Start-Script $_.FullName
    }
}
# Install specific programs
elseif ($Install) {
    $Install | ForEach-Object {
        Start-Script ".\Software\$_.ps1"
    }
}
# Or nothing
else {
    Write-Host "Skipping installation of Software" -ForegroundColor Magenta
}
