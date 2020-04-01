#                           ██           ██       ██                
#                          ░░           ░██      ░██                
# ██    ██  ██████   ██████ ██  ██████  ░██      ░██  █████   ██████
#░██   ░██ ░░░░░░██ ░░██░░█░██ ░░░░░░██ ░██████  ░██ ██░░░██ ██░░░░ 
#░░██ ░██   ███████  ░██ ░ ░██  ███████ ░██░░░██ ░██░███████░░█████ 
# ░░████   ██░░░░██  ░██   ░██ ██░░░░██ ░██  ░██ ░██░██░░░░  ░░░░░██
#  ░░██   ░░████████░███   ░██░░████████░██████  ███░░██████ ██████ 
#   ░░     ░░░░░░░░ ░░░    ░░  ░░░░░░░░ ░░░░░   ░░░  ░░░░░░ ░░░░░░  

PATH="/usr/local/sbin:$PATH"
PATH="$HOME/Library/Python/3.7/bin:$PATH"
PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export GOROOT=""
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export BROWSER=firefox
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'

export GNUPGHOME="${HOME}/.config/gnupg"
HISTFILE=~/.cache/.histfile
HISTSIZE=100000
SAVEHIST=100000

export _ZL_DATA=~/.config/.zlua
export ZGEN_RESET_ON_CHANGE="${HOME}/.zsh/plugins.zsh"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="!"
export GPG_TTY=$(tty)
export XDG_CONFIG_HOME="${HOME}/.config"

# ignore .DS_Store in autocompletions
FIGNORE=DS_Store
export FIGNORE=$FIGNORE:.git
