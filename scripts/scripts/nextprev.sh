#!/bin/sh

occupied="$(yabai -m query --windows | jq -r '.[] | select(.minimized == 0).space' | uniq)"

# using gnu grep
focused="$(yabai -m query --spaces --space | grep -Pom1 'index":\K\d')"

focus() {
    yabai -m space --focus "$1" && exit
}

case $1 in 
    next)
        for space in $occupied; do
            [ "$space" -gt "$focused" ] && focus "$space"
        done;;
    prev)
        prev=1
        for space in $occupied; do
            # store the largest space smaller than focused
            [ "$space" -lt "$focused" ] && [ "$space" -gt "$prev" ] && prev="$space"
            [ "$space" -ge "$focused" ] && focus "$prev"
        done;;
esac
