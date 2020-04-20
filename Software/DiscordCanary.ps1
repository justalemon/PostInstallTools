# Discord
# This installs the Canary (Alpha) version

$arguments = @{
    Name = "DiscordCanary"
    Uri = "https://discordapp.com/api/download/canary?platform=win"
    Arguments = "-s"
    StartKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    StartValue = "DiscordCanary"
    DeleteFile = $false
}
Start-Installation @arguments
