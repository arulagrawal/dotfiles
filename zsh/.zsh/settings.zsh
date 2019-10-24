setopt autocd extendedglob nomatch globdots extended_glob
unsetopt beep
zstyle ':completion:*' special-dirs false
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
