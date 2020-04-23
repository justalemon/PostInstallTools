# Enables a Windows feature
function Enable-Feature
{
    param(
        # The feature to enable
        [Parameter(Mandatory=$true)]
        [string]
        $Feature
    )

    Write-Host "Enabling " -ForegroundColor Cyan -NoNewline
    Write-Host $Feature -ForegroundColor White
    $ProgressPreference = "SilentlyContinue"
    Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName $Feature | Out-Null
    $ProgressPreference = "Continue"
}
