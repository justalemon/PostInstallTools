# Rockstar Games Launcher
# Game Launcher by Rockstar Games

$arguments = @{
    Name = "Rockstar Games Launcher"
    Uri = "https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe"
    Arguments = "/s","/t" # Taken from installscript.vdf on Steam for GTA IV, does not work
}
Start-Installation @arguments
