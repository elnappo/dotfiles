# elnappo’s dotfiles [![Build Status](https://travis-ci.org/elnappo/dotfiles.svg?branch=master)](https://travis-ci.org/elnappo/dotfiles)

These are my dotfiles, have fun!

add ~/.extra for your stuff

## Features
* sync your homebrew taps, formulas and casks with `$ brewsync`
* update osx, brew and the dotfiles repository with `$ update`
* set some osx defaults
* configuration is mainly handled by ansible (Playbook: ~/.dotfiles/init/dotfiles.yml)

## Install
```bash
$ git clone https://github.com/elnappo/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles/init
$ ./setup.sh
```

## Projects used
* [homebrew](https://github.com/Homebrew/homebrew)
* [homebrew cask](https://github.com/phinze/homebrew-cask)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [OSXDefaults](https://github.com/kevinSuttle/OSXDefaults)
* [ansible](https://github.com/ansible/ansible)
* [alias-tips](https://github.com/djui/alias-tips)
* [k](https://github.com/supercrabtree/k)
* [NeoBundle](https://github.com/Shougo/neobundle.vim)
* [VimAwesome](http://vimawesome.com/)

## Inspired by
* https://github.com/mathiasbynens/dotfiles
* https://github.com/alrra/dotfiles
* https://github.com/necolas/dotfiles
* https://github.com/monstermunchkin/dotfiles
* https://bitbucket.org/keimlink/dotfiles
