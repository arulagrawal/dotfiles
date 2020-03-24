# vim: ft=sh
if ! zgen saved; then
    # standard zsh stuff tbh
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zsh-history-substring-search

    # pure prompt
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    # prepend sudo when pressing esc
    zgen load hcgraf/zsh-sudo

    # z autojump stuff
    zgen load skywind3000/z.lua

    # extract plugin from ohz
    zgen load thetic/extract

    # autopair brackets etc
    zgen load hlissner/zsh-autopair
   
    # remind me of aliases
    zgen load djui/alias-tips 

    # fzf integrations
    zgen load junegunn/fzf shell/completion.zsh
    zgen load junegunn/fzf shell/key-bindings.zsh

    zgen save
fi
