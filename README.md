Nothing fancy at the moment, just a personal dotfiles repo.

#Install instructions

- Install oh-my-zsh
- clone this repo to ~/.dotfiles directory
- read and execute ~/.dotfiles/setup.sh

##VIM setup:

- install Vundle: git clone https://jgithub.com/gmarik/vundle.git ~/.vim/bundle/vundle
- Run the Vundle install process. Open Vim and execute ':BundleInstall'.
- YouCompleteMe:
  - cd ~/.vim/bundle/YouCompleteMe
  - python2 ./install.py --clang-completer
- Tern
  - cd ~/.vim/bundle/tern_for_vim
  - npm install

##Awesome setup:
- cd ~/.config/awesome
- git clone https://github.com/mikar/awesome-themes.git
- mv awesome-themes themes
