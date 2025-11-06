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

set -x EDITOR vim
set -x VISUAL vim
set -x GOPATH $HOME/Coding/golang
source $HOME/.dotfiles/config/fish/aliases.fish

if test -s $HOME/.dotfiles/extra.fish
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
        # Load grc
        test -s /etc/grc.fish; and source /etc/grc.fish

    case Darwin
        # Load iTerm2 shell integration
        test -s ~/.local/share/fish/iterm2_shell_integration.fish; and source ~/.local/share/fish/iterm2_shell_integration.fish
        # Add homebrew to $PATH
        test -d /opt/homebrew/bin ; and fish_add_path -g /opt/homebrew/bin
        test -d /opt/homebrew/sbin; and fish_add_path -g /opt/homebrew/sbin
        # Load Homebrew command not found
        set HOMEBREW_COMMAND_NOT_FOUND_HANDLER (brew --repository)/Library/Homebrew/command-not-found/handler.fish
        if test -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
          source $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
        end
        # Load grc
        test -s (brew --repository)/etc/grc.fish; and source (brew --repository)/etc/grc.fish
end

starship init fish | source
