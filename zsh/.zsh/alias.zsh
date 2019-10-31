#            ██ ██
#           ░██░░
#  ██████   ░██ ██  ██████    ██████
# ░░░░░░██  ░██░██ ░░░░░░██  ██░░░░
#  ███████  ░██░██  ███████ ░░█████
# ██░░░░██  ░██░██ ██░░░░██  ░░░░░██
#░░████████ ███░██░░████████ ██████
# ░░░░░░░░ ░░░ ░░  ░░░░░░░░ ░░░░░░

alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc && source ~/.zshrc'
alias joke='curl https://icanhazdadjoke.com && printf "\n"'
alias weather='curl wttr.in'
alias comp='killall compton; compton --config ~/.compton.conf & disown'
alias server='mosh arul@arul.io'
alias emacs='spawn emacs'
alias copy='xclip -sel clip'

alias q='exit 0'

if [ -x "$(command -v exa)" ]; then
    alias ls='exa'
    alias la='exa -a'
    alias ll='exa -la'
    alias l.='exa -ld .*'
else
    alias ls='ls --color=auto'
    alias la='ls -a'
    alias ll='ls -lha'
fi

alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias debug="set -o nounset; set -o xtrace"
alias cx='chmod +x'
alias du='du -kh'
alias df='df -kTh'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias svim='sudoedit'

alias f='ranger'

# aliases for yay (pacman helper)
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

alias dot='ranger ~/dotfiles/'
alias xres='nvim ~/.Xresources; xrdb ~/.Xresources'

# git stuff
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gp='git push'
alias gaa='git add -A'

alias fixtime='sudo ntpdate pool.ntp.org'
alias sudo='sudo '
