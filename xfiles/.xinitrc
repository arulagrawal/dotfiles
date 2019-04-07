#nvidia-settings --assign CurrentMetaMode="DPY-0: nvidia-auto-select @1920x1080 +1920+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
nitrogen --restore &
urxvtd -q -o -f
#urxvtd -q -o -f
xrdb merge ~/.Xresources &
#xsetroot -cursor_name left_ptr &
#flashfocus &
xset +fp /usr/share/fonts &
xset fp rehash &
#compton --config .compton.conf --blur-background &
#sxhkd &
exec bspwm
;;
