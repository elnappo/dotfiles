# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x EDITOR vim
set -x VISUAL vim
source $HOME/.dotfiles/config/fish/aliases.fish


switch (uname -s)
    case Linux
        source /usr/share/doc/pkgfile/command-not-found.fish

    case Darwin
        # Add homebrew to $PATH
        test -d /usr/local/bin ; and set -x PATH /usr/local/bin $PATH
        test -d /usr/local/sbin; and set -x PATH /usr/local/sbin $PATH
        
        brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)
end
