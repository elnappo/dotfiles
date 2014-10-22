# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git git-extra python django copydir brew osx pip web-search colored-man)

source $ZSH/oh-my-zsh.sh

setopt No_HIST_VERIFY

source $HOME/.dotfiles/shellrc
