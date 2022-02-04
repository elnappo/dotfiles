# promt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

source $HOME/.dotfiles/shellrc

# better history settings
export HISTFILE=$HOME/.local/share/bash/bash_history
shopt -s histappend # Append history instead of rewriting it
shopt -s cmdhist # Use one command per line
HISTCONTROL="erasedups:ignoreboth" # Avoid duplicate entries
HISTFILESIZE=1000000 # Allow a larger history file
HISTSIZE=1000000 # Allow a larger history file
HISTTIMEFORMAT='%F %T ' # Record timestamps
PROMPT_COMMAND='history -a' # Store history immediately

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

case "$(uname -s)" in
    Linux)
        [[ -s "/etc/profile.d/grc.bashrc" ]] && source /etc/profile.d/grc.bashrc
        ;;
    Darwin)
        [[ -s "~/.local/share/bash/iterm2_shell_integration.bash" ]] && source "~/.local/share/bash/iterm2_shell_integration.bash"
        [[ -s "`brew --repository`/etc/grc.bashrc" ]] && source "`brew --repository`/etc/grc.bashrc"
        # Load Homebrew Command Not Found
        HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
        if [ -f "$HB_CNF_HANDLER" ]; then
            source "$HB_CNF_HANDLER";
        fi
        ;;
esac
