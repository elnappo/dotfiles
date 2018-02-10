# elnappo’s dotfiles [![Build Status](https://travis-ci.org/elnappo/dotfiles.svg?branch=master)](https://travis-ci.org/elnappo/dotfiles)

These are my dotfiles, they can be used under macOS and Linux (mainly Arch Linux but Ubuntu is also supported). What is special about it is that Ansible is used to configure and sync your system settings. This has many advantages in contrast to simple bash scripts or a `Makefile`.

## Features

* update packages (homebrew, pacman, apt) and the dotfiles repository with `$ update`
* update your settings (dotfiles) with `$ dotfiles`
* sync your packages with `$ brewsync` between hosts
* Try to use consistent color theme and fonts between all components
* set some macOS defaults (`dotfiles/ansible/tasks/macos_defaults.yml`)
* set some Arch Linux specific options (`dotfiles/ansible/tasks/arch.yml`)
* dnsmasq with dnscrypt for encrypted and locally cached DNS queries (macOS only)
* try to keep `~/` clean
* configuration is mainly handled by Ansible (playbook: `~/.dotfiles/ansible/dotfiles.yml`)

## Included configurations

* OS
  * macOS
  * Arch Linux
  * Ubuntu / (CentOS)
* curl
* fish / zsh / bash
* GTK
* i3 (i3blocks)
* iTerm 2
* SSH
* Terminator
* Termite
* tmux
* Transmission
* Vim
* Visual Studio Code
* Wget

## Install (for me)

```bash
$ git clone https://github.com/elnappo/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles/init
$ ./setup.sh
```

## Install (for you)

* Fork this repository
* Edit at least the following files (better take a look at all files):

```
├── ansible
│   ├── tasks
│   │   └── macos_defaults.yml
│   ├── vars
│   │   ├── casks.yml
│   │   ├── formula.yml
│   │   ├── gems.yml
│   │   ├── pip.yml
│   │   └── taps.yml
│   └── vars.yml
└── init
    └── macos.bash
```

* Some interesting variables for the Ansible playbook are set in `dotfiles/ansible/vars.yml`

  * `login_shell: /usr/local/bin/fish`
  * `sudo_without_password: true`
  * `use_dnscrypt: true` install and configure [DNSCrypt](https://dnscrypt.org/) with [Unbound](https://unbound.net/) as local DNS cache
  * `login_window_text: Enter any 11-digit prime number to continue.` set a custom message to appear at the bottom of your login window (macOS)

* Clone and install dotfiles repository:

```bash
$ git clone https://github.com/<YOURNAME>/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles/init
$ ./setup.sh
```

## What is missing

* `gitconfig`

### SSH client configuration

`~/.ssh/config` or system wide in `/etc/ssh/ssh_config`, an basic example can be found at `contrib/ssh_config`.

## Inspired by

* https://bitbucket.org/keimlink/dotfiles
* https://gist.github.com/brandonb927/3195465
* https://github.com/alrra/dotfiles
* https://github.com/donnemartin/dev-setup
* https://github.com/drduh/OS-X-Security-and-Privacy-Guide
* https://github.com/herrbischoff/awesome-osx-command-line
* https://github.com/mathiasbynens/dotfiles
* https://github.com/monstermunchkin/dotfiles
* https://github.com/mrzool/bash-sensible
* https://github.com/necolas/dotfiles
