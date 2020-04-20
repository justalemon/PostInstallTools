# MongoDB Compass
# GUI for managing MongoDB instances

$arguments = @{
    Name = "MongoDB Compass"
    Uri = "https://downloads.mongodb.com/compass/mongodb-compass-community-1.20.5-win32-x64.msi"
    IsMSI = $true
}
Start-Installation @arguments
