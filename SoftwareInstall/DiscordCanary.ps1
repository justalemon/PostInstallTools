# Discord
# This installs the Canary (Alpha) version

Start-Installation -Uri "https://discordapp.com/api/download/canary?platform=win" -Filename "DiscordCanaryInstaller.exe" -Arguments "-s"
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "DiscordCanary"
