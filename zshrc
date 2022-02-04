# Path to your oh-my-zsh configuration.
ZSH=$HOME/.local/share/oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Which plugins would you like to load?
# See https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
plugins=(git git-extra python colored-man)

source $ZSH/oh-my-zsh.sh

# History file settings
HISTFILE=~/.local/share/zsh/zsh_history
setopt NO_HIST_VERIFY
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

source $HOME/.dotfiles/shellrc

case "$(uname -s)" in
    Linux)
        # Load grc
        [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
        ;;
    Darwin)
        [[ -s "~/.local/share/zsh/iterm2_shell_integration.zsh" ]] && source "~/.local/share/zsh/iterm2_shell_integration.zsh"
        # Load grc
        [[ -s "`brew --repository`/etc/grc.zsh" ]] && source "`brew --repository`/etc/grc.zsh"
        # Load Homebrew Command Not Found
        HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
        if [ -f "$HB_CNF_HANDLER" ]; then
            source "$HB_CNF_HANDLER";
        fi
        ;;
esac
