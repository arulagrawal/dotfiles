#!/bin/sh

occupied="$(yabai -m query --windows | jq -r '.[] | select(.minimized == 0).space' | uniq)"
# using gnu grep
focused="$(yabai -m query --spaces --space | grep -Pom1 'index":\K\d')"

focus() {
    yabai -m space --focus "$1" && exit
}

case $1 in 
    next)
        # next line to make adjacency wrap
        [ "$focused" -eq 6 ] && focused=0

        for space in $occupied; do
            [ "$space" -gt "$focused" ] && focus "$space"
        done;;
    prev)
        # next line to make adjacency wrap
        [ "$focused" -eq 1 ] && focused=7

        prev=1
        for space in $occupied; do
            # store the largest space smaller than focused
            [ "$space" -lt "$focused" ] && [ "$space" -gt "$prev" ] && prev="$space"
        done

        # then focus the space we selected in the loop
        focus "$prev";;
    *)
        echo "please choose either next or prev";;
esac
