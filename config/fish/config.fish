# Paths
test -d /usr/local/bin ; and set -x PATH /usr/local/bin $PATH
test -d /usr/local/sbin; and set -x PATH /usr/local/sbin $PATH

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x EDITOR vim
set -x VISUAL vim
source $HOME/.dotfiles/config/fish/aliases.fish

# Install brew casks in /Applications
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# docker-machine
set -x DOCKER_TLS_VERIFY yes
set -x DOCKER_CERT_PATH $HOME/.docker/machine/machines/dev
set -x DOCKER_HOST tcp://192.168.99.100:2376

# Load iTerm 2 shell integration
test -e {$HOME}/.config/fish/iterm2_shell_integration.fish; and source {$HOME}/.config/fish/iterm2_shell_integration.fish
