#!/usr/bin/env bash

# set osx defaults
echo "[i] Set OS X defaults"
./osx

# install homwbrew
echo "[i] Install Homebrew"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install brew formula
echo "[i] Install Brew formula"
brew bundle Brewfile

# install brew cask apps
echo "[i] Install brew cask apps"
./cask

# install oh-my-zsh
echo "[i] Install oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# setup zsh as default shell
echo "[i] Set zsh as default shell"
chsh -s /usr/local/bin/zsh
source ~/.zshrc

# linking files
echo "[i] Linking dotfiles"
ln -s ../bashrc ~/.bashrc
ln -s ../zshrc ~/.zshrc
ln -s ../wgetrc ~/.wgetrc
ln -s ../vimrc ~/.vimrc
ln -s ../curlrc ~/.curlrc

# Some stuff
echo "[i] Doing some stuff"
mkdir ~/.virtualenvs 

echo "[+] Done :)"
