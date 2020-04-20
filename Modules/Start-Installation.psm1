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
        $DeleteFile = $true,
        # If the installation uses an MSI file via msiexec.exe
        [switch]
        $IsMSI = $false
    )

    # Create the path that we are going to use
    $ext = if ($IsMSI) {"msi"} else {"exe"}
    $file = "$env:TEMP\$Name.Installer.$ext"

    # Remove the existing temp file if it exists
    Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    # Download the executable file and save it to %TEMP%
    Invoke-WebRequest -Uri $Uri -OutFile $file

    # If this is an MSI, add the msiexec arguments and set the correct executable
    if ($IsMSI)
    {
        $Arguments = "/i",$file,"/passive" + $Arguments
        $Executable = "C:\Windows\System32\msiexec.exe"
    }
    else {
        $Executable = $File
    }

    # Start the process with a clean Path and wait for it to finish
    Start-Process -FilePath $file -ArgumentList $Arguments -UseNewEnvironment -Wait
    # Finally, remove the temp file that we used
    if ($DeleteFile) { Remove-Item -Path $file -Force }
    # And delete the run on start key if is present
    if ($StartKey -And $StartValue) {
        Remove-ItemProperty -Path $StartKey -Name $StartValue
    }
}
