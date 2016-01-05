# elnappo’s dotfiles [![Build Status](https://travis-ci.org/elnappo/dotfiles.svg?branch=master)](https://travis-ci.org/elnappo/dotfiles)

These are my dotfiles, have fun! 

add ~/.extra for your stuff

## Features
* sync your homebrew taps, formulas, casks, python packages and gems with `$ brewsync`
* update osx, brew and the dotfiles repository with `$ update`
* update your settings (dotfiles) with `$ dotfiles`
* set some osx defaults (`dotfiles/ansible/tasks/osx_defaults.yml`)
* dnsmasq with dnscrypt for encrypted and localy cached DNS queries
* try to keep `~/` clean
* configuration is mainly handled by ansible (Playbook: `~/.dotfiles/ansible/dotfiles.yml`)

## Install (for me)
```bash
$ git clone https://github.com/elnappo/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles/init
$ ./setup.sh
```

## Install (for you)
* Fork this repository
* Some interesting variables for the ansible playbook are set in `dotfiles/ansible/vars.yml`
* Edit at least the following files (better take a look at all files):

```
├── ansible
│   ├── tasks
│   │   ├── osx_defaults.yml
│   ├── vars
│   │   ├── casks.yml
│   │   ├── formula.yml
│   │   ├── gems.yml
│   │   ├── pip.yml
│   │   └── taps.yml
│   └── vars.yml
├── init
│   ├── osx.sh
```

```bash
$ git clone https://github.com/<YOURNAME>/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles/init
$ ./setup.sh
```

## Projects used
* [homebrew](https://github.com/Homebrew/homebrew)
* [homebrew cask](https://github.com/phinze/homebrew-cask)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [OSXDefaults](https://github.com/kevinSuttle/OSXDefaults)
* [ansible](https://github.com/ansible/ansible)
* [NeoBundle](https://github.com/Shougo/neobundle.vim)
* [VimAwesome](http://vimawesome.com/)
* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
* [Oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)

## Inspired by
* https://github.com/mathiasbynens/dotfiles
* https://github.com/alrra/dotfiles
* https://github.com/necolas/dotfiles
* https://github.com/monstermunchkin/dotfiles
* https://bitbucket.org/keimlink/dotfiles
* https://gist.github.com/brandonb927/3195465
* https://github.com/donnemartin/dev-setup
