setopt autocd extendedglob nomatch globdots extended_glob completeinword
unsetopt beep
zstyle ':completion:*' special-dirs false
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select=0 interactive
# ls colors
autoload -U colors && colors

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

(( $+commands[dircolors] )) && eval "$(dircolors -b)"

ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null}

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# settings for pure prompt
PURE_PROMPT_SYMBOL="❯❯"
PURE_PROMPT_VICMD_SYMBOL="❮❮"
PURE_GIT_UP_ARROW="↑"
PURE_GIT_DOWN_ARROW="↓"
