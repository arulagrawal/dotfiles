#!/bin/bash
polybar burs & disown
polybar bur & disown
compton --config ~/.compton.conf & disown
pactl set-sink-volume 0 50%
pactl set-sink-volume 1 50%
wmname LG3D
urxvtd -q -o -f
xst -c dropdown -g 212x20+1920+0
