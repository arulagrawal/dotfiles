nitrogen --restore &
xrdb merge ~/.Xresources &
xsetroot -cursor_name left_ptr &
#flashfocus &
~/scripts/colors.sh &
xset +fp /usr/share/fonts &
xset fp rehash &
#compton --config .compton.conf --blur-background &
#sxhkd &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec bspwm
;;
