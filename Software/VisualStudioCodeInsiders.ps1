# Visual Studio Code Insiders
# A Multiplatform Code Editor by Microsoft

$arguments = @{
    Name = "Visual Studio Code Insiders"
    Uri = "https://go.microsoft.com/fwlink/?Linkid=852155"
    Arguments = "/VERYSILENT","/NORESTART","/MERGETASKS=!runcode"
}
Start-Installation @arguments
