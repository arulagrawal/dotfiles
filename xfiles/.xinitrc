urxvtd -q -o -f
xrdb merge ~/.Xresources &
xset +fp /usr/share/fonts &
xset fp rehash &
exec bspwm
;;
