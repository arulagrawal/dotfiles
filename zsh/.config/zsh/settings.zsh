setopt autocd extendedglob nomatch globdots extended_glob COMPLETE_IN_WORD
setopt inc_append_history share_history HIST_IGNORE_ALL_DUPS no_list_ambiguous MENU_COMPLETE
setopt combiningchars HIST_IGNORE_SPACE
unsetopt beep

zstyle ':completion:*' special-dirs false
zstyle ':completion:*:functions' ignored-patterns '_*'
# zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select=2 interactive

bindkey -e

rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# settings for pure prompt
PURE_PROMPT_SYMBOL="❯❯"
PURE_PROMPT_VICMD_SYMBOL="❮❮"
PURE_GIT_UP_ARROW="↑"
PURE_GIT_DOWN_ARROW="↓"

