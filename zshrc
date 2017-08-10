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
        [[ -s "/etc/profile.d/grc.zsh" ]] && source /etc/profile.d/grc.zsh
        [[ -s "/usr/share/doc/pkgfile/command-not-found.zsh" ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
        ;;

    Darwin)
        source "`brew --prefix`/etc/grc.zsh"
        ;;
esac
