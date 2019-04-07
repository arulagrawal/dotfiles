#!/bin/bash
#what gui applications to open by default

apps=(firefox spotify redshift-gtk discord)
for a in "${apps[@]}"
do
    $a & disown
done
cd ~
