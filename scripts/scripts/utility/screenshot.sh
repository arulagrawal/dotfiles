#!/bin/sh
#modified from github.com/ym1234

name="$HOME/images/scrots/$(date +'%F:%R:%S').png"
case $1 in
	area)
		maim -g "$(slop)" "$name" ;;
	whole)
		maim "$name" ;;
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
curl -sF"file=@$name" https://paste.arul.io | xclip -selection clipboard -in
dunstify -u normal "Screenshot taken!" "$(xclip -selection clipboard -out)"
