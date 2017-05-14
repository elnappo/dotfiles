#!/usr/bin/env bash
set -e

echo "[i] Ask for sudo password"
sudo -v

case "$(uname -s)" in
    Darwin)
        # install Command Line Tools
        if [[ ! -x /usr/bin/gcc ]]; then
          echo "[i] Install macOS Command Line Tools"
          xcode-select --install
        fi

        # install homwbrew
        if [[ ! -x /usr/local/bin/brew ]]; then
          echo "[i] Install Homebrew"
          ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi

        # install ansible
        if [[ ! -x /usr/local/bin/ansible ]]; then
            echo "[i] Install Ansible"
            brew install ansible
        fi

        # set macos defaults
        echo "[i] Set some specific macOS settings"
        set +e
        ./macos.bash
        set -e
        ;;

    Linux)
        if [ -f /etc/os-release ]
            then
                . /etc/os-release

                case "$ID_LIKE" in
                    debian)
                        echo "[i] Install Ansible"
                        sudo apt-get install -y ansible
                        ;;

                    archlinux)
                        echo "[i] Install Ansible"
                        sudo pacman -S ansible --noconfirm
                        ;;

                    *)
                        echo "[!] Unsupported Linux Distribution: $ID"
                        exit 1
                        ;;
                esac
            else
                echo "[!] Unsupported Linux Distribution"
                exit 1
            fi
        ;;

    *)
        echo "[!] Unsupported OS"
        exit 1
        ;;
esac

echo "[i] Move .bashrc to bashrc_backup if exists"
if [ -f $HOME/.bashrc ] && [ ! -h $HOME/.bashrc ]
then
    mv $HOME/.bashrc $HOME/bashrc_backup
fi

# run playbook
echo "[i] Run Playbook"
ansible-playbook ../ansible/dotfiles.yml --ask-become-pass

echo "[i] From now on you can use $ dotfiles to manage your dotfiles"
echo "[i] Done."
