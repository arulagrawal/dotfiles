#!/bin/sh
name="$HOME/Pictures/Screenshots/$(date +'%F:%R:%S').png"
case $1 in
    whole)
        screencapture "$name" ;;
    area)
        screencapture -i "$name" ;;
    window)
        screencapture -w "$name" ;;
esac

if [ -f "$name" ]; then
    curl -sF "file=@$name" "https://${PAUSER}:${PAPASS}@arul.io" | pbcopy
    URL="$(pbpaste)"
    osascript -e "display notification \"$URL\" with title \"Screenshot uploaded!\""
fi
