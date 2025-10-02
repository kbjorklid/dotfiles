Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell --cmd cd) -join "`n"
})
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

Remove-Alias -Name ls -ErrorAction SilentlyContinue

function ls {
    eza --long --git --header --icons @args
}

function tree {
    eza --tree --icons @args
}
