# Setup for Windows

start command line

winget install chezmoi
powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
chezmoi init https://github.com/kbjorklid/dotfiles.git
chezmoi apply

Note: the execution policy is set for the current session only. If you want unrestricted script execution, you can do 


