# Source environment specific things
source $HOME/.dotfiles/env.local.sh
export PATH=$PATH:$HOME/.dotfiles/bin

# --- General environment variables ---
export EDITOR=vim


# --- Oh My Zsh ---
ZSH=$HOME/.oh-my-zsh
#export ZSH_THEME="candykb"
#export ZSH_THEME="steeef"
#export ZSH_THEME="rkj-repos"
export ZSH_THEME="kb"

plugins=(git hg npm github bower jira web-search)
source $ZSH/oh-my-zsh.sh

# --- .dotfiles ---
source $HOME/.dotfiles/aliases
for file in $HOME/.dotfiles/functions/*; do
    if [ -f ${file} ]; then
        source ${file}
    fi
done

CHEAT_DIR=$HOME/.cheat

# --- Colors ---
#Base16 colors, see https://github.com/chriskempson/base16
source /home/kalleb/.dotfiles/base16-shell/base16-default.dark.sh


# --- Shell options ---
# History
export HISTIGNORE="ls:cd:cd ~:pwd"
# Make tmux window names permanent
export DISABLE_AUTO_TITLE=true
# Bindings
bindkey '^[OA' history-beginning-search-backward 
bindkey '^[OB' history-beginning-search-forward 
bindkey -v
# Autocorrect typos:
setopt correct
alias vim='nocorrect vim'
setopt inc_append_history
setopt auto_pushd
fpath=(~/.dotfiles/functions/completion $fpath)
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# --- Node version manager ---
NVM_DIR="/home/kalleb/.nvm"
if [[ -d "$NVM_DIR" ]]; then
    export NVM_DIR
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
