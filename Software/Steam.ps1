# Steam
# Who doesn't know Steam?

$arguments = @{
    Name = "Steam"
    Uri = "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
    Arguments = "/S"
    StartKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    StartValue = "Steam"
}
Start-Installation @arguments
