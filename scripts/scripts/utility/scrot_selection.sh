#!/bin/sh
dunstify -u normal "region screenshot taken" "in ~/Pictures/screenshots";
scrot -s -e '0x0 $f && mv $f ~/Pictures/screenshots/' | xclip -sel clip;
dunstify -u low "0x0 url" "copied to clipboard";
