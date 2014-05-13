# promt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# User configuration
source $HOME/.dotfiles/aliases
source $HOME/.dotfiles/extra
export EDITOR='vim'

# for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install brew casks in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
#source /Library/Frameworks/Python.framework/Versions/3.3/bin/virtualenvwrapper.sh

echo "happy hacking :)"
