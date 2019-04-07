#!/bin/bash
polybar burs &
polybar bur &
compton --config ~/.compton.conf --blur-background & disown
pactl set-sink-volume 0 50%
pactl set-sink-volume 1 50%
wmname LG3D
./defaultsetup.sh &
