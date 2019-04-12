#!/usr/bin/env bash
read -r X Y W H < <(slop -f "%x %y %w %h" -b 1 -t 0 -q)
# Width and Height in px need to be converted to columns/rows
# To get these magic values, make a fullscreen st, and divide your screen width by ${tput cols}, height by ${tput lines}
col=$(echo "1920/210" | bc)
row=$(echo "1080/56" | bc)
(( W /= $col))
(( H /= $row))
g=${W}x${H}+${X}+${Y}
bspc rule -a xst-256color -o state=floating
if [ "$1" == "perl6" ]; then
    xst -g $g -e perl6
else
    xst -g $g
fi
