# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh/oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git git-extra python django copydir brew osx pip web-search colored-man docker brew-cask k alias-tips jump)

# Set oh-my-zsh customization directory
if [[ ! -f $HOME/.dotfiles/zsh/zsh_custom ]]; then
	ZSH_CUSTOM=$HOME/.dotfiles/zsh/zsh_custom
fi

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.dotfiles/zsh/zsh_history

setopt NO_HIST_VERIFY
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

source $HOME/.dotfiles/shellrc

