# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git git-extra python django copydir brew osx pip web-search colored-man)

source $ZSH/oh-my-zsh.sh

# User configuration

source $HOME/.aliases
source $HOME/.extra
export EDITOR='vim'
setopt No_HIST_VERIFY
export PATH=/usr/local/bin:$PATH

# Install brew casks in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# for virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#source /Library/Frameworks/Python.framework/Versions/3.3/bin/virtualenvwrapper.sh

echo "happy hacking :)"
