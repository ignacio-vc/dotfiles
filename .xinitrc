#!/bin/sh

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

xset +fp /home/ignacio/.local/share/fonts
xset fp rehash

exec i3
