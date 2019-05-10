#!/bin/bash
#render the bar
polybar burs & disown
polybar bur & disown

#launch compton for transparency and blur
compton --config ~/.compton.conf & disown

#set volume to 50%
pactl set-sink-volume 0 50%

#set wmname to LG3D to trick java applications into working
wmname LG3D

#bind capslock to escape
xmodmap ~/dotfiles/capslock

#make keypress repetition way faster
xset r rate 350 60
