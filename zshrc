# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="candykb"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git npm github)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/kalleb/bin:/home/kalleb/apps/idea/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/kalleb/.npmglobal/bin

source $HOME/.dotfiles/aliases

bindkey '^[OA' history-beginning-search-backward 
bindkey '^[OB' history-beginning-search-forward 

bindkey -v
setopt inc_append_history
# setopt share_history
setopt auto_pushd
autoload -U compinit && compinit
zstyle ':completion:*' menu select

export JAVA_HOME=/opt/java/jdk1.7.0_45/


NODE_PATH=$NODE_PATH:/home/kalleb/.npmglobal/lib/node_modules
