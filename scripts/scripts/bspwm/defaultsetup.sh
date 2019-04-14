#!/bin/bash
#what gui applications to open by default

apps=(sxhkd firefox spotify redshift-gtk discord unclutter)
for a in "${apps[@]}"
do
    $a & disown
done
urxvtd -q -o -f
