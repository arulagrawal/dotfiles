#!/bin/sh
fwid=$(bspc query -N -n focused)

wattr wh "$fwid" | {
	read -r width height
	if [ "$width" -gt "$height" ] ; then
		bspc node -p \~south
	else
		bspc node -p \~east
	fi
}
