#!/bin/sh

# mimic gnome environment in order to use exo-preferred-applications
# gnome env will also recognize magnet link handlers for chromium
export DE=gnome
export BROWSER=chromium
export EDITOR=vim

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=ssh,pkcs11,keyring,secrets,gpg)
export GNOME_KEYRING_CONTROL
export SSH_AUTH_SOCK

xset r rate 200 40
numlockx &

exec i3
