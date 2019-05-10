#!/bin/sh
hide() {
    #sid=$(wmctrl -lx | grep dropdownterm | awk '{print $1}')
    bspc node "$sid" --flag hidden
    bspc node "$sid" --to-desktop "focused:^1";
}

show() {
    #sid=$(wmctrl -lx | grep dropdownterm | awk '{print $1}')
    bspc node "$sid" --flag hidden
    bspc node "$sid" --to-desktop "focused:focused" --focus;
}

open=$(wmctrl -lx | grep -o dropdownterm)
if [[ -z "$open" ]]
then
    st -c dropdownterm -g 212x20+1920+0 & disown
    sleep 0.1
fi
sid=$(wmctrl -lx | grep dropdownterm | awk '{print $1}')
ishidden=$(bspc query -T -n $sid | grep -o "hidden\":true")
#echo "$ishidden"
#echo "sid is $sid"d;
if [[ -z "$ishidden" ]]
then
    hide
else
    show
fi
exit
