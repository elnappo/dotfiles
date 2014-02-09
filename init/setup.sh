#!/usr/bin/env bash

# install homwbrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# set osx defaults
./osx

# install brew formula
brew bundle Brewfile

export PATH=(brew --prefix coreutils)/libexec/gnubin:$PATH

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# setup zsh as default shell
chsh -s /usr/local/bin/zsh

# install brew cask apps
./cask

echo "[+] Done :)

