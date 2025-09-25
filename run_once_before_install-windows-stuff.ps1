# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
    $CommandLine = "-NoExit -File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
    Start-Process -Wait -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
    Exit
  }
}
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

function Install-ChocoPackageIfMissing {
    param([string]$PackageName)

    $installed = choco list --local-only $PackageName --exact --limit-output
    if (-not $installed) {
        Write-Host "Installing $PackageName..."
        choco install -y $PackageName
    } else {
        Write-Host "$PackageName is already installed, upgrading..."
        choco upgrade -y $PackageName
    }
}

function Install-WingetPackage {
    param([string]$PackageName)

    Write-Host "Installing $PackageName..."
    winget install $PackageName
}

Install-WingetPackage "Chocolatey.Chocolatey"
Install-WingetPackage "Git.Git"
Install-WingetPackage "Neovim.Neovim"
Install-WingetPackage "Google.Chrome"
Install-WingetPackage "GitHub.cli"
Install-WingetPackage "Google.GoogleDrive"
Install-WingetPackage "Microsoft.PowerShell"
Install-WingetPackage "wez.wezterm"
Install-WingetPackage "ajeetdsouza.zoxide"
Install-WingetPackage "JesseDuffield.lazygit"
Install-WingetPackage "Microsoft.PowerToys"
Install-WingetPackage "Microsoft.WindowsTerminal"
Install-WingetPackage "Discord.Discord"
Install-WingetPackage "OpenJS.NodeJS.LTS"

Install-ChocoPackageIfMissing "mingw"
Install-ChocoPackageIfMissing "make"
Install-ChocoPackageIfMissing "unzip"
Install-ChocoPackageIfMissing "ripgrep"
Install-ChocoPackageIfMissing "fd"
Install-ChocoPackageIfMissing "win32yank"
Install-ChocoPackageIfMissing "wget"

#Install-Module -Name Terminal-Icons -Repository PSGallery
