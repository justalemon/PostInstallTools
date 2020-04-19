function Start-Installation
{
    param(
        # The Uri to download the executable
        [Parameter(Mandatory=$true)]
        [String]
        $Uri,
        # The desired filename with the extension
        [Parameter(Mandatory=$true)]
        [String]
        $Filename,
        # Arguments to pass onto the executable
        [Parameter(Mandatory=$true)]
        [String[]]
        $Arguments
    )

    # Create the path that we are going to use
    $file = "$env:TEMP\$Filename"
    # Remove the existing temp file if it exists
    Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    # Download the executable file and save it to %TEMP%
    Invoke-WebRequest -Uri $Uri -OutFile $file
    # Start the process with a clean Path and wait for it to finish
    Start-Process -FilePath $file -ArgumentList $Arguments -UseNewEnvironment -Wait
    # Finally, remove the temp file that we used
    Remove-Item -Path $file -Force
}
