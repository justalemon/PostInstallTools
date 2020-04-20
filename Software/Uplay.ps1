# Uplay
# Game Launcher by Ubisoft

$arguments = @{
    Name = "Uplay"
    Uri = "https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe"
    Arguments = "/S"
}
Start-Installation @arguments
