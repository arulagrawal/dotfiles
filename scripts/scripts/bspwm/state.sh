#!/bin/sh
case "$1" in
    tiling)
        bspc node -t $(bspc query -N -n -n .tiled > /dev/null && echo floating || echo tiled) ;;
    fullscreen)
        bspc node -t fullscreen;;
    sticky)
        bspc node --flag sticky;;
esac
