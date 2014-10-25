#!/bin/sh
DIR="$( cd "$( dirname "$0" )" && pwd )" 
OHMYZSHDIR=~/.oh-my-zsh

ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/candykb.zsh-theme $OHMYZSHDIR/themes
ln -s $DIR/vim/colors ~/.vim/colors