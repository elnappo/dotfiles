#!/bin/sh

# mimic gnome environment in order to use exo-preferred-applications
# gnome env will also recognize magnet link handlers for chromium
export DE=gnome
export BROWSER=chromium
export EDITOR=vim

numlockx &

exec i3
