param (
    # The programs to install
    [String[]]
    $Features,
    # The features to install
    [String[]]
    $Software,
    # If all of the programs should be installed
    [switch]
    $InstallAllPrograms = $false,
    # If all of the features should be installed
    [switch]
    $InstallAllFeatures = $false
)

# Start by importing the custom modules
Import-Module -Force ".\Modules\Invoke-Everything.psm1"
Import-Module -Force ".\Modules\Start-Installation.psm1"

# Iterate over the programs that we need to install
$Software | ForEach-Object {
    # And run that scripts of it
    & ".\Software\$_.ps1"
}
