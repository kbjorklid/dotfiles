# File: run_once_install-packages.ps1
Write-Host "Running Windows package installation script..."

# Install PowerShell Modules
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
Install-Module -Name PSReadLine -Scope CurrentUser -Force

winget install --id 'Git.Git' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Zen-Team.Zen-Browser' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Obsidian.Obsidian' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Neovim.Neovim' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'GitHub.cli' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Google.Chrome' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Google.GoogleDrive' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Microsoft.PowerShell' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'wez.wezterm' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Chocolatey.Chocolatey' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Apache.OpenOffice' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'JesseDuffield.lazygit' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'ajeetdsouza.zoxide' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'sharkdp.fd' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Microsoft.VisualStudioCode' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Microsoft.PowerToys' --source  --accept-package-agreements --accept-source-agreements
winget install --id 'Microsoft.WindowsTerminal' --source  --accept-package-agreements --accept-source-agreements

