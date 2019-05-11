# My Aliases
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc && source ~/.zshrc'
alias joke='curl https://icanhazdadjoke.com && printf "\n"'
alias weather='curl wttr.in'
alias comp='killall compton; compton --config .compton.conf --blur-background & disown'
alias server='mosh arul@arul.io'
alias code='vscodium'
alias copy='xclip -sel clip'
alias todo='todoist'
alias less='$PAGER'

alias q='exit 0'

alias la='ls -Ah'
alias ll='ls -lAh'
alias l.='ls -ld .*'

alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias debug="set -o nounset; set -o xtrace"
alias x='chmod +x'

alias du='du -kh'
alias df='df -kTh'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sv='sudoedit'

alias f='lf'

alias pup='sudo pacman -Syyu' # update
alias pin='sudo pacman -S'    # install
alias pun='sudo pacman -Rs'   # remove
alias pcc='sudo pacman -Scc'  # clear cache
alias pls='pacman -Ql'        # list files
alias prm='sudo pacman -Rnsc' # really remove, configs and all

alias yup='yay' # update
alias yin='yay -S'    # install
alias yun='yay -Rs'   # remove
alias ycc='yay -Scc'  # clear cache
alias yls='yay -Ql'        # list files
alias yrm='yay -Rnsc' # really remove, configs and all

alias pkg='makepkg --printsrcinfo > .SRCINFO && makepkg -fsrc'
alias spkg='pkg --sign'

alias mk='make && make clean'
alias smk='sudo make clean install && make clean'
alias ssmk='sudo make clean install && make clean && rm -iv config.h'

alias calc='python -qi -c "from math import *"'

alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'

alias dot='lf ~/dotfiles'
alias xres='nvim ~/.Xresources; xrdb ~/.Xresources'
