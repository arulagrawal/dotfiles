#!/bin/bash

# catch non-bash and non-interactive shells
[[ $- == *i* && $BASH_VERSION ]] && SHELL=/bin/bash || return 0

# set some defaults
export MANWIDTH=90
export HISTSIZE=10000
export HISTIGNORE="q:f:v"
export EDITOR=nvim

# colors in less (manpager)
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# ensure ~/bin is on the path
[[ $PATH =~ ~/bin ]] || PATH=~/bin:$PATH

set -o vi
set -o notify

shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify
[[ $DISPLAY ]] && shopt -s checkwinsize

# prompt if file sourcing below fails
PS1='[\u@\h \W]\$ '

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters

# export PROMPT_LNBR1=''
# export PROMPT_MULTILINE=''
# export PROMPT_USERFMT='\u\[\e[0m\]@\[\e[31m\]\h '

# source shell configs
for f in "$HOME/.bash/"*?.bash; do
    . "$f"
done
#aliases
alias vimrc='nvim ~/.config/nvim/init.vim'
alias bashrc='nvim ~/.bashrc; source ~/.bashrc'
alias joke='curl https://icanhazdadjoke.com && printf "\n"'
alias weather='curl wttr.in'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'









#endaliases

#al-info
#neofetch
#custom commands

# up.sh: Quickly traverse up the current working path.
# Author: Shannon Moeller <me@shannonmoeller.com>
# Source to use: [ -f /path/to/up.sh ] && . /path/to/up.sh

__updir() {
	if [[ "$1" == "/" || -z "$1" || -z "$2" ]]; then
		return
	fi

	local p="$(dirname $1)"
	local a="$(basename $p)"
	local b="$(basename $2)"

	if [[ -z "$a" || -z "$b" ]]; then
		return
	fi

	if [[ "$a" == "$b"* ]]; then
		echo "$p"
		return
	fi

	__updir "$p" "$2"
}

__upnum() {
	if [[ -z "$1" || -z "$2" || ! "$2" =~ ^[0-9]+$ ]]; then
		return
	fi

	local p="$1"
	local i="$2"

	while (( i-- )); do
		p="$(dirname $p)"
	done

	echo "$p"
}

_up() {
	local p="$(dirname $PWD)"
	local w="${COMP_WORDS[COMP_CWORD]}"

	COMPREPLY=( $(IFS=';' compgen -S/ -W "${p//\//;}" -- "$w") )
}

up() {
	# up one
	if (( ! $# )); then
		cd ..
		return
	fi

	# up dir
	local d="$(__updir "$PWD" "$1")"

	if [[ -d "$d" ]]; then
		cd "$d"
		return
	fi

	# up num
	local n="$(__upnum "$PWD" "$1")"

	if [[ -d "$n" ]]; then
		cd "$n"
		return
	fi

	# fallback
	if [[ $1 == - || -d $1 ]]; then
		cd $1
		return
	fi

	# usage
	echo -e "usage: up [dir|num|-]\npwd: $PWD"
}

# zsh compatibility
if [[ -n ${ZSH_VERSION-} ]]; then
	autoload -U +X bashcompinit && bashcompinit
fi

# tab-completion
complete -o nospace -F _up up

eval $(thefuck --alias)



# run on start
fortune
