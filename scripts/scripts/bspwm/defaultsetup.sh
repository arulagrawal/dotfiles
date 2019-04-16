#!/bin/bash
#what gui applications to open by default
#and other application too apparently

##
#sxhkd for keyboard shortcuts, run keys for help
#firefox for web
#spotify for music
#redshift for the eyes
#discord for the mates
#unclutter to hide the mouse when its inactive
#udiskie to auto mount usb devices
##

apps=(sxhkd firefox spotify redshift-gtk discord unclutter udiskie)
for a in "${apps[@]}"
do
    $a & disown
done

