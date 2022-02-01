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

if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add k kubectl
    abbr --add c code
    abbr --add g git
    abbr --add v vim
    abbr --add d docker
end

switch (__fish_os_id_like)
    case archlinux
        test -s /usr/share/doc/pkgfile/command-not-found.fish; and source /usr/share/doc/pkgfile/command-not-found.fish
        # Load grc as omf plugin is incomplete
        test -s /etc/grc.fish; and source /etc/grc.fish

    case Darwin
        # Add homebrew to $PATH
        test -d /opt/homebrew/bin ; and set -x PATH /opt/homebrew/bin $PATH
        test -d /opt/homebrew/sbin; and set -x PATH /opt/homebrew/sbin $PATH
        # Load Homebrew Command Not Found
        set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
        if test -f $HB_CNF_HANDLER
            source $HB_CNF_HANDLER
        end
        # Load grc as omf plugin is incomplete
        test -s (brew --repository)/etc/grc.fish; and source (brew --repository)/etc/grc.fish
end
