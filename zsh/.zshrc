#                 ██     
#                ░██     
#  ██████  ██████░██     
# ░░░░██  ██░░░░ ░██████ 
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░ 

if [ ! -d ~/.config/zgen ]; then
    echo "getting zgen"
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.config/zgen"
fi

source "${HOME}/.config/zgen/zgen.zsh"
for config (${HOME}/.config/zsh/*.zsh) source $config;
