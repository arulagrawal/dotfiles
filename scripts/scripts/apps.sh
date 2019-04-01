#!/bin/bash
cd ~
redshift &
polybar burs &
polybar bur &
compton --config ~/.compton.conf --blur-background &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
pactl set-sink-volume 0 50%
pactl set-sink-volume 1 50%
optirun -b none nvidia-settings --load-config-only -c :8
