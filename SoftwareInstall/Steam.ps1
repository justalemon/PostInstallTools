# Steam
# Who doesn't know Steam?

Start-Installation -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe" -Filename "SteamInstaller.exe" -Arguments "/S"
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Steam"
