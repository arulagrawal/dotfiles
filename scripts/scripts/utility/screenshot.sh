#!/bin/sh
#stolen from github.com/ym1234

name="$HOME/Pictures/screenshots/$(date +'%F:%R:%S').png"
case $1 in
	area)
		shotgun -g "$(slop)" "$name" ;;
	*)
		shotgun "$name" ;;
esac
curl -sF"file=@$name" https://0x0.st | xclip -selection clipboard -in
dunstify -u normal "Screenshot taken!" "$(xclip -selection clipboard -out)"
