#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )" 
OHMYZSHDIR=$HOME/.oh-my-zsh
AWESOMEDIR=$HOME/.config/awesome

ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/ideavimrc ~/.ideavimrc
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/candykb.zsh-theme $OHMYZSHDIR/themes
ln -s $DIR/vim/colors ~/.vim/colors
ln -s $DIR/vim/UltiSnips ~/.vim/UltiSnips
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/.Xresources ~/.Xresources
ln -s $DIR/awesome/rc.lua $AWESOMEDIR/rc.lua
ln -s $DIR/awesome/runonce.lua $AWESOMEDIR/runonce.lua
ln -s $DIR/awesome/volume.lua $AWESOMEDIR/volume.lua
cp $DIR/env.template.sh $DIR/env.local.sh
cp $DIR/gitconfig.template $DIR/gitconfig.local
