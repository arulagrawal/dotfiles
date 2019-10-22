#                 ██     
#                ░██     
#  ██████  ██████░██     
# ░░░░██  ██░░░░ ░██████ 
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░ 


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/arul/.oh-my-zsh"
fpath=( "$HOME/.zfunctions" $fpath )
fpath+=("$HOME/.zsh/pure")
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch globdots
unsetopt beep
bindkey -v

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
         zsh-autosuggestions
         zsh-syntax-highlighting
         extract
         sudo
         z
         fzf
         colored-man-pages
         history-substring-search
         golang)

source $ZSH/oh-my-zsh.sh

source ~/scripts/utility/todoist_functions.sh
for config (~/.zsh/*.zsh) source $config;
autoload -U promptinit; promptinit
prompt pure
PROMPT=">> "
zstyle ':completion:*' special-dirs false
export FZF_BASE=/bin/fzf

# # Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
