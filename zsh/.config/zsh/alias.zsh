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
alias kettle='mosh arul@arul.io'
alias oven='mosh arul@192.168.70.66'

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
alias cx='chmod +x'
alias du='du -kh'
alias df='df -kh'

alias vim='nvim'
alias svim='sudoedit'

alias calc='python3 -qi -c "from math import *"'

alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'

# git stuff
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gp='git push'
alias gaa='git add -A'
alias gd='git diff --color | less -R' #weird hack to get mouse scrolling in macOS

alias sudo='sudo '
