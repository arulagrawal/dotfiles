#!/bin/sh

node=$(xdotool search --class drop)

if [ -z $node ]; then
    bspc rule -a \* -o state=floating rectangle=1920x400+1920+0 &&
    nohup kitty --class drop >/dev/null 2>&1 &
else
    bspc node $node --to-desktop "focused:focused"
    bspc node $node --flag hidden
    bspc node $node --focus
fi
