#!/bin/zsh
DIR="$( cd "$( dirname "$0" )" && pwd )" 
OHMYZSHDIR=$HOME/.oh-my-zsh
AWESOMEDIR=$HOME/.config/awesome

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
_link "vimrc" ".vimrc"
_link "ideavimrc" ".vimrc"
_link "zshrc" ".zshrc"
_link "kb.zsh-theme" "$OHMYZSHDIR/themes/kb.zsh-theme"
_link "vim/colors" ".vim/colors"
_link "vim/UltiSnips" ".vim/UltiSnips"
_link "gitconfig" ".gitconfig"
_link ".Xresources" ".Xresources"
_link "npmrc" ".npmrc"
_link "tmux.conf" ".tmux.conf"
_link "cheat" ".cheat"
_link ".tmuxinator" ".tmuxinator"
_copy "env.template.sh" "$DIR/env.local.sh"
_copy "gitconfig.template" "$DIR/gitconfig.local"
_gitclone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
_gitclone "https://github.com/gmarik/vundle.git" "$HOME/.vim/bundle/vundle"
_gem "tmuxinator"

gem update

# _link "awesome/rc.lua", "$AWESOMEDIR/rc.lua"
# _link "awesome/runconce.lua", "$AWESOMEDIR/runonce.lua"
# _link "awesome/volume.lua", "$AWESOMEDIR/volume.lua"

# ln -s $DIR/ideavimrc ~/.ideavimrc
# ln -s $DIR/zshrc ~/.zshrc
# ln -s $DIR/kb.zsh-theme $OHMYZSHDIR/themes
# ln -s $DIR/vim/colors ~/.vim/colors
# ln -s $DIR/vim/UltiSnips ~/.vim/UltiSnips
# ln -s $DIR/gitconfig ~/.gitconfig
# ln -s $DIR/.Xresources ~/.Xresources
# ln -s $DIR/npmrc ~/.npmrc
# ln -s $DIR/tmux.conf ~/.tmux.conf
# ln -s $DIR/cheat ~/.cheat
# ln -s $DIR/awesome/rc.lua $AWESOMEDIR/rc.lua
# ln -s $DIR/awesome/runonce.lua $AWESOMEDIR/runonce.lua
# ln -s $DIR/awesome/volume.lua $AWESOMEDIR/volume.lua
# cp $DIR/env.template.sh $DIR/env.local.sh
# cp $DIR/gitconfig.template $DIR/gitconfig.local



