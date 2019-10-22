#!/bin/sh
#render the bars
# killall polybar
# nohup polybar burs > /dev/null &
# nohup polybar bur > /dev/null &

#launch compton for rounded corners
# killall compton
# compton --config ~/.compton.conf &
~/scripts/bspwm/fixcompton.sh
nohup snooze -H '*' ~/scripts/bspwm/fixcompton.sh &

#set volume to 50%
pactl set-sink-volume 0 50%

#set wmname to LG3D to trick java applications into working
wmname LG3D

#bind capslock to escape
xmodmap ~/dotfiles/capslock

#make keypress repetition way faster
xset r rate 350 60

#time out settings
xset dpms 600 900 1000

#fix mouse pointer
xsetroot -cursor_name left_ptr

#cache spotify art for time script
~/scripts/utility/cache_spotify_art.sh &

#make keypress repetition way faster
xset r rate 350 60
