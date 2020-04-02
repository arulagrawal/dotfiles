setopt autocd extendedglob nomatch globdots extended_glob completeinword
setopt inc_append_history share_history
unsetopt beep

zstyle ':completion:*' special-dirs false
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select=0 interactive

# stop thefuck from taking over sudo esc
zstyle ":prezto:module:thefuck" bindkey "no"

# settings for pure prompt
PURE_PROMPT_SYMBOL="❯❯"
PURE_PROMPT_VICMD_SYMBOL="❮❮"
PURE_GIT_UP_ARROW="↑"
PURE_GIT_DOWN_ARROW="↓"
