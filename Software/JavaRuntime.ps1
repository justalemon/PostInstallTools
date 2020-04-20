# Java Runtime Environment
# Required by Minecraft, that's it

$arguments = @{
    Name = "Java Runtime Environment"
    Uri = "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242060_3d5a2bb8f8d4428bbe94aed7ec7ae784"
    Arguments = "INSTALL_SILENT=Enable","EULA=Disable","REBOOT=Disable","REMOVEOUTOFDATEJRES=0"
}
Start-Installation @arguments
