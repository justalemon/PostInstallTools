# Runs every single ps1 file in a directory
function Invoke-Everything
{
    param(
        # The directory with the ps1 files
        [Parameter(Mandatory=$true)]
        [String]
        $Directory
    )

    Get-ChildItem "$Directory\*.ps1" | ForEach-Object {
        Write-Host "Currently running " -NoNewline
        Write-Host " $_" -ForegroundColor White
        & $_.FullName
    }
}
