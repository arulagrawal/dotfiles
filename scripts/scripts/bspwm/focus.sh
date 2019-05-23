#!/bin/sh
#
# modified from github.com/turquoise-hexagon

targets(){
    case $1 in
        focused)
            bspc query -N -n .focused.\!fullscreen;;
        normal)
            bspc query -N -n .local.\!focused.\!fullscreen
            bspc query --monitor any --nodes -n .\!focused.active;;
         esac
}

# exit when fullscreen
bspc query -N -n focused.fullscreen > /dev/null && exit

case $1 in
    east)  arg=xy; op=-gt;;
    west)  arg=xy; op=-lt;;
    north) arg=yx; op=-lt;;
    south) arg=yx; op=-gt
esac

# get the coordinates of all windows on the current desktop
wattr "i$arg" "$(targets focused)" $(targets normal) | {
    read -r cur cur_1 cur_2

    # sort the coordinates to find the closest window
    while read -r win win_1 win_2; do
        [ "$win_1" "$op" "$cur_1" ] && {
            win_1=$((win_1 - cur_1)); win_1=${win_1#-}
            win_2=$((win_2 - cur_2)); win_2=${win_2#-}

            [ $((! min_1 || win_1 < min_1 || win_1 == min_1 && win_2 < min_2)) -eq 1 ] &&
                { min_1=$win_1; min_2=$win_2; focus=$win; }
        }
    done

    bspc node "$focus" -f
}

