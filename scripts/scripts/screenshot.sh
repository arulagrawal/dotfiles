#!/bin/sh

name="$HOME/Pictures/Screenshots/$(date +'%F:%R:%S').png"
case $1 in
    whole)
        screencapture "$name" ;;
    area)
        screencapture -s "$name" ;;
    window)
        screencapture -w "$name" ;;
esac

curl -sF "file=@$name" https://paste.arul.io | pbcopy
URL="$(pbpaste)"
osascript -e "display notification \"$URL\" with title \"Screenshot uploaded!\""
