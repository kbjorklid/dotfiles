# Source environment specific things
source $HOME/.dotfiles/env.local.sh

#Oh My Zsh
ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="candykb"
# export ZSH_THEME="steeef"
# export ZSH_THEME="bira"
plugins=(git npm github bower jira web-search)
source $ZSH/oh-my-zsh.sh

# Source some stuff from under dotfiles
source $HOME/.dotfiles/aliases
for file in $HOME/.dotfiles/functions/*; do
    if [ -f ${file} ]; then
        source ${file}
    fi
done

# History
export HISTIGNORE="ls:cd:cd ~:pwd"

# Misc config
bindkey '^[OA' history-beginning-search-backward 
bindkey '^[OB' history-beginning-search-forward 
bindkey -v

setopt inc_append_history
setopt auto_pushd
fpath=(~/.dotfiles/functions/completion $fpath)
autoload -U compinit && compinit
zstyle ':completion:*' menu select


