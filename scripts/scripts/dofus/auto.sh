#!/bin/bash
#Automatically Raises the Dofus window that is flashing
while [ 1 -lt 2 ] ; do
	for id in `xdotool search --name "Dofus"`; do
		xprop -id $id | grep "_NET_WM_STATE_DEMANDS_ATTENTION"  > /dev/null 2>&1
		if [ "$?" = "0" ]; then
    	wmctrl -i -a $id
		fi
	done
	sleep 1
done
