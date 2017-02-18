#!/bin/zsh
DIR="$( cd "$( dirname "$0" )" && pwd )" 
OHMYZSHDIR=$HOME/.oh-my-zsh

_link() {
    local source="$DIR/$1"
    local target="$HOME/$2"
    if [[ $2 == /* ]]; then
        target="$2"
    fi

    if [[ -L "$target" ]]; then
        echo "[INFO] Symlink already exists: $target"
    elif [[ -f "$target" ]]; then
        echo "[WARN] A regular file exists: $target"
    else
        ln -s "$source" "$target"
        echo "[INFO] Symlink created: $target"
    fi
}

_copy() {
    local source="$DIR/$1"
    local target="$HOME/$2"
    if [[ $2 == /* ]]; then
        target="$2"
    fi

    if [[ -f "$target" ]]; then
        echo "[INFO] Target file already exists: $target"
    else
        cp "$source" "$target"
        echo "[INFO] Copied to: $target"
    fi
}

_gem() {
    which gem &> /dev/null
    if [[ $? -eq 1 ]]; then
        echo "[ERROR] gem is not installed"
        return 
    fi
    local installed=false
    local gemtest="`gem list --local | grep $1`"
    if [[ "x$gemtest" == "x" ]]; then
        echo "[INFO] Installing with gem: $1"
        gem install "$1"
    else
        echo "[INFO] Already intalled; updating with gem: $1"
    fi
}

_gitclone() {
    which git &> /dev/null
    if [[ $? -eq 1 ]]; then
        echo "[ERROR] git is not installed"
        return 
    fi
    local gitrepo="$1"
    local target="$HOME/$2"
    local info="$3"
    if [[ $2 == /* ]]; then
        target="$2"
    fi

    if [[ -d "$target" ]]; then
        echo "[INFO] target directory already exists: $target"
    else
        git clone "$gitrepo" "$target"
        echo "[INFO] cloned: $info"
    fi
}
# This is just silly.
mkdir -p "$HOME/.config/nvim"
_link "nvim/init.vim" ".config/nvim/init.vim"
_link "idea/ideavimrc" ".ideavimrc"
_link "zsh/zshrc" ".zshrc"
_link "oh-my-zsh-themes/kb.zsh-theme" "$OHMYZSHDIR/themes/kb.zsh-theme"
_copy "git/gitconfig.template" "$DIR/git/gitconfig.local"
_link "git/gitconfig.local" ".gitconfig"
_link "javascript/npmrc" ".npmrc"
_link "tmux/tmux.conf" ".tmux.conf"
_link "tmux/tmuxinator" ".tmuxinator"
_link "python/pylintrc" ".pylintrc"
_copy "env/env.template.sh" "$DIR/env/env.local.sh"
_gitclone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
_gem "tmuxinator"

gem update
