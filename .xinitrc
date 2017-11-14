#!/bin/sh

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

exec "setxkbmap -layout us,es"

exec i3
