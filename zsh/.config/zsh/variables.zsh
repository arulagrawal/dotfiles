#                           ██           ██       ██                
#
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
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export GOROOT=""
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export BROWSER=firefox
export EDITOR='nvim'
export VISUAL='nvim'

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="/tmp"
export GNUPGHOME="${HOME}/.config/gnupg"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CARGO_HOME="${XDG_CACHE_HOME}/cargo"

HISTFILE=~/.cache/.histfile
HISTSIZE=100000
SAVEHIST=100000

export _Z_DATA="${HOME}/.cache/z"
export ZGEN_RESET_ON_CHANGE="${HOME}/.zsh/plugins.zsh"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="!"
export GPG_TTY=$(tty)
export MANPAGER='less -R'

# ignore .DS_Store in autocompletions
FIGNORE=DS_Store
export FIGNORE=$FIGNORE:.git
