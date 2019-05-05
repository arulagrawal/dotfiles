#!/bin/bash
dunstify -u normal "Screenshot taken" "in ~/Pictures/screenshots";
scrot -e '0x0 $f; mv $f ~/Pictures/screenshots/' | xclip -sel clip;
dunstify -u low "0x0 url" "copied to clipboard";
