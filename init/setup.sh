#!/usr/bin/env bash

# set osx defaults
echo "[i] Set OS X defaults"
./osx

# install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
  echo "[i] Install Command Line Tools"
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
	brew install ansible --HEAD
fi

# run playbook
echo "[i] Run Playbook"
ansible-playbook -i inventory dotfiles.yml -ask-sudo-pass

echo "[i] From now on you can use $ dotfiles to manage your dotfiles"
echo "[+] Done :)"
