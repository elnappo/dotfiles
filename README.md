# elnappo’s dotfiles [![Build Status](https://travis-ci.org/elnappo/dotfiles.svg?branch=master)](https://travis-ci.org/elnappo/dotfiles)

These are my dotfiles.

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
│   │   └── osx_defaults.yml
│   ├── vars
│   │   ├── casks.yml
│   │   ├── formula.yml
│   │   ├── gems.yml
│   │   ├── pip.yml
│   │   └── taps.yml
│   └── vars.yml
└── init
    └── osx.sh
```

```bash
$ git clone https://github.com/<YOURNAME>/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles/init
$ ./setup.sh
```

## What is missing?
### SSH client configuration
`~/.ssh/config` or system wide in `/etc/ssh/ssh_config`

```
Host *
    HashKnownHosts yes
    PasswordAuthentication no
    ChallengeResponseAuthentication no
    PubkeyAuthentication yes
    HostKeyAlgorithms ssh-ed25519-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ssh-ed25519,ssh-rsa,ecdsa-sha2-nistp521-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp521,ecdsa-sha2-nistp384,ecdsa-sha2-nistp256
    KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group-exchange-sha256
    Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
    MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-ripemd160-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,hmac-ripemd160,umac-128@openssh.com
```

## Projects used
* [ansible](https://github.com/ansible/ansible)
* [homebrew](https://github.com/Homebrew/homebrew)
* [homebrew cask](https://github.com/phinze/homebrew-cask)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [OSXDefaults](https://github.com/kevinSuttle/OSXDefaults)
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
* https://github.com/herrbischoff/awesome-osx-command-line
* https://github.com/drduh/OS-X-Security-and-Privacy-Guide
* https://github.com/mrzool/bash-sensible
