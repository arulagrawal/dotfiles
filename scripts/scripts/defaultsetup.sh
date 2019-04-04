#!/bin/bash
nvidia-settings --assign CurrentMetaMode="DPY-0: nvidia-auto-select @1920x1080 +1920+0 {ViewPortIn=1920x1080, ViewPortOut=1920x1080+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
spotify & disown
lxappearance & disown
killall lxappearance
discord & disown
google-chrome-stable & disown
urxvt -e sh -c "neofetch; zsh"
redshift-gtk & disown
