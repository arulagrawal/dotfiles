#!/bin/bash
polybar burs & disown
polybar bur & disown
compton --config ~/.compton.conf & disown
pactl set-sink-volume 0 50%
pactl set-sink-volume 1 50%
wmname LG3D
