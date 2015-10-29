# Easier navigation
function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end
  
# Color output
function grep -d "File pattern searcher"
    command grep --color=auto $argv; end

function ls -d "Colorized ls"
    command ls -G $argv; end

function l -d "l"
    ls -lah $argv; end

function tree -d "List contents of directories in a tree-like format"
    command tree -C; end

# Set custom params
function df -d "Display free disk space"
    command df -h $argv; end

function pwgen -d "Generate saves passwords"
    command pwgen --capitalize --numerals --symbols --secure 16; end

function axel -d "Multiple connections wget"
    command axel -an 10 $argv; end

function ssht -d "Attach to remote tmux session"
    ssh $argv -t "tmux a"; end

function gp -d "Run git push"
    git push $argv; end

function gu -d "Run git-up"
    git-up; end

function reload -d "Reload fish config"
    source ~/.config/fish/config.fish; end

function ip -d "Get public IP"
    dig +short myip.opendns.com @resolver1.opendns.com; end

function ips -d "Get all IPs"
    ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'; end

function lscleanup -d "Clean up LaunchServices to remove duplicates in the Open With menu"
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder; end

function cleanup -d " Recursively delete .DS_Store"
    find . -type f -name '*.DS_Store' -ls -delete; end

function emptytrash -d "Empty all Trashs and clear system log"
    sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; end

function mergepdf -d "Merge PDF files"
    System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py $argv; end

function update -d "Update the system"
    sudo softwareupdate -i -a; brew update; and brew upgrade --all; brew cleanup; brew cask cleanup; git -C ~/.dotfiles pull; end

function afk -d "Lock the screen (when going AFK)"
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend; end

function pubkey -d "Copy my public key to the pasteboard"
    more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'; end

function p8 -d "Ping 8.8.8.8"
    ping 8.8.8.8; end

function pg -d "Ping google.de"
    ping google.de; end

function wifipass -d "Get password from a saved AP"
    security find-generic-password -g -D "AirPort network password" -w -a $argv; end

function wifipow -d "Perform a wireless broadcast scan"
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s; end

function ccat -d "Syntax highlighting cat"
    pygmentize -g $argv; end

function ssh_ignore -d "Ignore ssh config"
    ssh -F /dev/null $argv; end

function starwars -d "Play Star Wars in ASCII"
    telnet towel.blinkenlights.nl; end

function brewsync -d "Sync your installed tools"
    ansible-playbook -i $HOME/.dotfiles/ansible/inventory $HOME/.dotfiles/ansible/dotfiles.yml --tags packages; end

function dotfiles -d "Run dotfiles Playbook"
    ansible-playbook -i $HOME/.dotfiles/ansible/inventory $HOME/.dotfiles/ansible/dotfiles.yml $argv; end

function play -d "Run an ansible playbook (alias)"
    ansible-playbook $argv; end

function s -d "Open in Sublime Text"
    subl $argv; end

function smod -d "Show permissions in decimal"
    stat -c "%a %n"; end

function ubuntu -d "Create a short lived Ubuntu container"
    docker run -rm -ti ubuntu /bin/bash; end
