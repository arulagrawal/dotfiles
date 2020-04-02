#!/bin/sh

query="$(yabai -m query --spaces)"
occupied="$(echo "$query" | jq -r 'map(select(.windows | length > 0)) | .[].index')"
focused="$(echo "$query" | jq -r '.[] | select(.focused == 1).index')"

case $1 in 
    next)
        for num in $occupied; do
            [ "$num" -gt "$focused" ] && yabai -m space --focus "$num" && exit
        done;;
    prev)
        prev=1
        for num in $occupied; do
            # store the largest number smaller than focused
            [ "$num" -lt "$focused" ] && [ "$num" -gt "$prev" ] && prev=$num
            [ "$num" -ge "$focused" ] && yabai -m space --focus "$prev" && exit
        done;;
esac
