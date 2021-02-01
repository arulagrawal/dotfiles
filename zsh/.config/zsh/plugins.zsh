# vim: ft=sh
# standard zsh stuff tbh


zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

# pure prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# prepend sudo when pressing esc
zinit ice wait lucid
zinit light hcgraf/zsh-sudo

# z
zinit ice wait blockf lucid
zinit light rupa/z

# z tab completion
zinit ice wait lucid
zinit light changyuheng/fz

# z / fzf (ctrl-g)
zinit ice wait lucid
zinit light andrewferrier/fzf-z

# extract plugin from ohz
zinit ice wait lucid
zinit light thetic/extract

# autopair brackets etc
zinit ice wait'1' lucid
zinit light hlissner/zsh-autopair

# remind me of aliases
zinit ice wait lucid
zinit light djui/alias-tips 

# fzf integrations
zinit ice wait lucid multisrc'shell/{key-bindings,completion}.zsh'
zinit light junegunn/fzf

zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice wait'1' lucid
zinit light laggardkernel/zsh-thefuck

# note, obtain https://github.com/arcticicestudio/nord-dircolors
zinit ice atclone"gdircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS


zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# temp solution from https://github.com/zdharma/fast-syntax-highlighting/issues/179
zinit ice wait'2' lucid atload"zicompinit; zicdreplay; FAST_HIGHLIGHT[chroma-man]="
zinit light zdharma/fast-syntax-highlighting
