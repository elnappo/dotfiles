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

# Load iTerm 2 shell integration
test -e {$HOME}/.config/fish/iterm2_shell_integration.fish; and source {$HOME}/.config/fish/iterm2_shell_integration.fish

brew command command-not-found-init > /dev/null; and . (brew command-not-found-init)
