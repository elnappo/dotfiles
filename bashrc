# promt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

source $HOME/.dotfiles/shellrc

# better history settings
export HISTFILE=$HOME/.local/share/bash/bash_history
shopt -s histappend # Append history instead of rewriting it
shopt -s cmdhist # Use one command per line
HISTCONTROL=ignoreboth # Don’t store specific lines
HISTFILESIZE=1000000 # Allow a larger history file
HISTSIZE=1000000 # Allow a larger history file
HISTTIMEFORMAT='%F %T ' # Record timestamps
PROMPT_COMMAND='history -a' # Store history immediately

# Load iTerm 2 shell integration
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
