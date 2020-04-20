function Start-Script
{
    param(
        [Parameter(Mandatory=$true)]
        [String]
        $Script
    )

    Write-Host "Starting script " -ForegroundColor Magenta -NoNewline
    Write-Host $Script -ForegroundColor White
    & $Script
}
