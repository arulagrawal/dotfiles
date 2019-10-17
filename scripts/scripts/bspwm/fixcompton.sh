#!/bin/sh
killall compton
nohup compton --config ~/.compton.conf > /dev/null &
