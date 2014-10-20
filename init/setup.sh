#!/usr/bin/env bash

# set osx defaults
echo "[i] Set OS X defaults"
./osx

# install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
  echo "[i] Install Command Line Tools"
  xcode-select --install
fi

# install homwbrew
if [[ ! -x /usr/local/bin/brew ]]; then
  echo "[i] Install Homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# install brew formula
echo "[i] Install Brew formula"
brew bundle Brewfile

# add brew replaced shells to /etc/shells
echo "[i] Add brew shells to /etc/shells"
sudo echo "/usr/local/bin/bash" >> /etc/shells
sudo echo "/usr/local/bin/zsh" >> /etc/shells

# install brew cask apps
echo "[i] Install brew cask apps"
./cask

# install oh-my-zsh
echo "[i] Install oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# setup zsh as default shell
echo "[i] Set zsh as default shell"
chsh -s /usr/local/bin/zsh

# linking files
echo "[i] Linking dotfiles"
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/wgetrc ~/.wgetrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/curlrc ~/.curlrc

# install python packages
#echo "[i] Install Python Packages"
#/usr/local/bin/pip3install httpie

# Some stuff
echo "[i] Doing some stuff"
mkdir ~/.virtualenvs 

echo "[+] Done :)"
