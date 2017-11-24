# Returns OS ID_LIKE variable
function __fish_os_id_like
    switch (uname -s)
        case Linux
            if test -s /etc/os-release
                echo (cat /etc/os-release | grep "ID_LIKE" | cut -d "=" -f 2)
            else
                echo "Linux"
            end

        case Darwin
            echo "Darwin" 
    end
end

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -x EDITOR vim
set -x VISUAL vim
set -x GOPATH $HOME/Coding/golang
source $HOME/.dotfiles/config/fish/aliases.fish

if test -e $HOME/.dotfiles/extra.fish
    source $HOME/.dotfiles/extra.fish
end

switch (__fish_os_id_like)
    case archlinux
        test -s /usr/share/doc/pkgfile/command-not-found.fish; and source /usr/share/doc/pkgfile/command-not-found.fish
        # Load grc as omf plugin is incomplete
        test -s /etc/grc.fish; and source /etc/grc.fish

    case Darwin
        # Add homebrew to $PATH
        test -d /usr/local/bin ; and set -x PATH /usr/local/bin $PATH
        test -d /usr/local/sbin; and set -x PATH /usr/local/sbin $PATH
        brew command command-not-found-init > /dev/null 2>&1; and . (brew command-not-found-init)
        # Load grc as omf plugin is incomplete
        test -s /usr/local/etc/grc.fish; and source /usr/local/etc/grc.fish
end

