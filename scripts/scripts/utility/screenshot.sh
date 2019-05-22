#!/bin/sh
#modified from github.com/ym1234

name="$HOME/Pictures/screenshots/$(date +'%F:%R:%S').png"
case $1 in
	area)
		shotgun -g "$(slop)" "$name" ;;
	whole)
		shotgun "$name" ;;
esac
case $2 in
    monitor)
        focusedmon=$(bspc query -M -m --names)
        case $focusedmon in
            HDMI-0)
                convert "$name" -crop 1920x1080+1920+0 "$name" ;;
            eDP-1-1)
                convert "$name" -crop 1920x1080+0+0 "$name" ;;
        esac
        ;;
    *)
        ;;
esac
curl -sF"file=@$name" https://0x0.st | xclip -selection clipboard -in
dunstify -u normal "Screenshot taken!" "$(xclip -selection clipboard -out)"
