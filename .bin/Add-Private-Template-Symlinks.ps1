# Check if script is running as administrator, if not, relaunch as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Script is not running as administrator. Relaunching with administrator privileges..."
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-File", $MyInvocation.MyCommand.Path)
    exit
}

# Define source and destination directories
$sourceDirectory = "$PSScriptRoot\..\private\.foam\templates"
$destinationDirectory = "$PSScriptRoot\..\.foam\templates"

# Check if the source directory exists
if (-not (Test-Path -Path $sourceDirectory -PathType Container)) {
    Write-Host "Source directory not found."
    exit
}

# Check if the destination directory exists, if not, create it
if (-not (Test-Path -Path $destinationDirectory -PathType Container)) {
    New-Item -Path $destinationDirectory -ItemType Directory -Force | Out-Null
}

# Get all files in the source directory
$files = Get-ChildItem -Path $sourceDirectory -File

# Loop through each file and create symlink in destination directory
foreach ($file in $files) {
    $linkPath = Join-Path -Path $destinationDirectory -ChildPath $file.Name
    $targetPath = $file.FullName

    # Check if symlink already exists
    if (-not (Test-Path -Path $linkPath -PathType Leaf)) {
        # Create symlink
        New-Item -ItemType HardLink -Path $linkPath -Value $targetPath
        Write-Host "Symlink created for $($file.Name)"
    } else {
        Write-Host "Symlink already exists for $($file.Name)"
    }
}

pause