#!/bin/sh

# mimic gnome environment in order to use exo-preferred-applications
# gnome env will also recognize magnet link handlers for chromium
export DE=gnome
export BROWSER=chromium
export EDITOR=vim

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,gpg)
xset r rate 200 40
numlockx &

exec i3

