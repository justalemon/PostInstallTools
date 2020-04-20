function Start-Installation
{
    param(
        # The name of this program
        [Parameter(Mandatory=$true)]
        [String]
        $Name,
        # The Uri to download the executable
        [Parameter(Mandatory=$true)]
        [String]
        $Uri,
        # Arguments to pass onto the executable
        [Parameter(Mandatory=$true)]
        [String[]]
        $Arguments,
        # The registry key that makes the application auto start
        [String]
        $StartKey,
        # The registry value that makes the application auto start
        [String]
        $StartValue,
        # If the temporary file should be removed after installation
        [switch]
        $DeleteFile
    )

    # Create the path that we are going to use
    $file = "$env:TEMP\$Name.Installer.exe"
    # Remove the existing temp file if it exists
    Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    # Download the executable file and save it to %TEMP%
    Invoke-WebRequest -Uri $Uri -OutFile $file
    # Start the process with a clean Path and wait for it to finish
    Start-Process -FilePath $file -ArgumentList $Arguments -UseNewEnvironment -Wait
    # Finally, remove the temp file that we used
    if (-Not $DeleteFile) { Remove-Item -Path $file -Force }
}
