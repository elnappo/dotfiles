# Easier navigation
function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end

# Color output
function grep -d "File pattern searcher"
    command grep --color=auto $argv; end

function ls -d "Colorized ls"
    switch (uname -s)
        case Darwin
            command ls -G $argv
        case "*"
            command ls --color $argv
    end
end

function l -d "l"
    ls -lah $argv; end

function tree -d "List contents of directories in a tree-like format"
    command tree -C; end

# Set custom params
function df -d "Display free disk space"
    command df -h $argv; end

function pwgen -d "Generate safe passwords"
    command pwgen --capitalize --numerals --secure 16; end

function axel -d "Multiple connections wget"
    command axel -an 10 $argv; end

function ssh-copy-id -d "Use locally available keys to authorise logins on a remote machine"
    env SSH_OPTS='-F /dev/null' command ssh-copy-id $argv; end

function ssht -d "Attach to remote tmux session"
    ssh $argv -t "tmux a"; end

function reload -d "Reload fish config"
    source ~/.config/fish/config.fish; end

function myip -d "Get public IP"
    dig +short myip.opendns.com @resolver1.opendns.com; end

function cleanup -d "Recursively delete .DS_Store"
    find . -type f -name '*.DS_Store' -ls -delete; end

function update -d "Update the system"
    switch (__fish_os_id_like)
        case archlinux
            sudo pacman -Syu --noconfirm

        case debian
            sudo apt update
            sudo apt dist-upgrade -y
            sudo apt autoremove -y
            sudo apt autoclean

        case "rhel fedora"
            sudo yum upgrade -y

        case Darwin
            brew update
            brew upgrade
            brew cleanup
    end
    git -C ~/.dotfiles pull
end

function mpi -d "Install packages"
    switch (__fish_os_id_like)
        case archlinux
            sudo pacman -S $argv

        case debian
            sudo apt install $argv

        case "rhel fedora"
            sudo yum install $argv

        case Darwin
            brew install $argv
    end
end

function afk -d "Lock the screen (when going AFK)"
    switch (uname -s)
        case Linux
            i3lock -i $HOME/Pictures/i3lock.png
        case Darwin
            /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
    end
end

function p8 -d "Ping 8.8.8.8"
    ping 8.8.8.8; end

function pg -d "Ping google.de"
    ping google.de; end

function ccat -d "Syntax highlighting cat"
    pygmentize -g $argv; end

function ssh_ignore -d "Ignore ssh config"
    ssh -F /dev/null $argv; end

function starwars -d "Play Star Wars in ASCII"
    telnet towel.blinkenlights.nl; end

function brewsync -d "Sync your installed tools"
    ansible-playbook $HOME/.dotfiles/ansible/dotfiles.yml --tags packages; end

function dotfiles -d "Run dotfiles Playbook"
    ansible-playbook $HOME/.dotfiles/ansible/dotfiles.yml $argv; end

function play -d "Run an ansible playbook (alias)"
    ansible-playbook $argv; end

function s -d "Open in Sublime Text"
    switch (__fish_os_id_like)
        case archlinux
            subl3 $argv
        case Darwin
            subl $argv
    end
end

function smod -d "Show decimal permissions"
    stat -c "%a %n"; end

function ubuntu -d "Create a short lived Ubuntu container"
    docker run --rm -ti ubuntu /bin/bash; end

# Load OS specific functions
switch (uname -s)
    case Linux
        function pacman -d "Package manager utility"
            command sudo pacman $argv; end

        function apt -d ""
            command sudo apt $argv; end

    case Darwin
        function wifipass -d "Get password from a saved AP"
            security find-generic-password -g -D "AirPort network password" -w -a $argv; end

        function wifipow -d "Perform a wireless broadcast scan"
            /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s; end

        function pubkey -d "Copy my public key to the pasteboard"
            more ~/.ssh/id_ed25519.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'; end

        function lscleanup -d "Clean up LaunchServices to remove duplicates in the Open With menu"
            /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder; end

        function mergepdf -d "Merge PDF files"
            System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py $argv; end

end
