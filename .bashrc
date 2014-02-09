# promt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# User configuration
source $HOME/.aliases
source $HOME/.extra
export EDITOR='vim'
export PATH=/usr/local/bin:$PATH

# Install brew casks in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "happy hacking :)"
