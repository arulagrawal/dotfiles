#!/bin/bash
#what gui applications to open by default
#and other application too apparently

##
#sxhkd for keyboard shortcuts, run keys for help
#chromium for web
#spotify for music
#redshift for the eyes
#discord for the mates
#unclutter to hide the mouse when its inactive
#udiskie to auto mount usb devices
##

apps=(sxhkd chromium spotify redshift discord unclutter udiskie xst)
for a in "${apps[@]}"
do
    $a & disown
done

