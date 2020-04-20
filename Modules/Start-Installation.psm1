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
        [String[]]
        $Arguments = @(),
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
    # Log the name of the program that we are installing and do some tweaking
    Write-Host "Starting installation of " -ForegroundColor Cyan -NoNewline
    Write-Host $Name -ForegroundColor White
    $ProgressPreference = "SilentlyContinue"

    # Create the path that we are going to use
    $ext = if ($IsMSI) {"msi"} else {"exe"}
    $file = "$env:TEMP\$Name.Installer.$ext"

    # Remove the existing temp file if it exists
    Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    # Download the executable file and save it to %TEMP%
    Write-Host "Downloading " -ForegroundColor Green -NoNewline
    Write-Host $Uri -ForegroundColor White -NoNewline
    Write-Host " to " -ForegroundColor Green -NoNewline
    Write-Host $file -ForegroundColor White -NoNewline
    Write-Host " - Please wait..." -ForegroundColor Green
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
    # Sadly we need to do it like this for optional arguments
    # https://github.com/PowerShell/PowerShell/issues/4520 is not part of PS 5.1
    Write-Host "Starting " -ForegroundColor Yellow -NoNewline
    Write-Host "$Executable " -ForegroundColor White -NoNewline
    if ($Arguments)
    {
        Write-Host $Arguments -ForegroundColor White
        Start-Process -FilePath $Executable -ArgumentList $Arguments -UseNewEnvironment -Wait
    }
    else {
        Write-Host "" -ForegroundColor White
        Start-Process -FilePath $Executable -UseNewEnvironment -Wait
    }

    # Finally, remove the temp file that we used
    if ($DeleteFile) { Remove-Item -Path $file -Force }
    # And delete the run on start key if is present
    if ($StartKey -And $StartValue) {
        Remove-ItemProperty -Path $StartKey -Name $StartValue
    }

    # Once everything is done, restore some of the tweaks
    $ProgressPreference = "Continue"
}
