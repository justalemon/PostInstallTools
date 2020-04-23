# MongoDB
# A NoSQL Database System

$arguments = @{
    Name = "MongoDB"
    Uri = "https://fastdl.mongodb.org/win32/mongodb-win32-x86_64-2012plus-4.2.5-signed.msi"
    Arguments = "SHOULD_INSTALL_COMPASS=""0""","ADDLOCAL=""ServerService,Router,Client,MonitoringTools,ImportExportTools,MiscellaneousTools"""
    Type = 1
}
Start-Installation @arguments
