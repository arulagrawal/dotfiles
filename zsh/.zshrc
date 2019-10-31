#                 ██     
#                ░██     
#  ██████  ██████░██     
# ░░░░██  ██░░░░ ░██████ 
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░ 

if [ ! -f ~/.local/bin/antibody ]; then
    curl -sfL git.io/antibody | sh -s - -b ~/.local/bin
fi

for config (~/.zsh/*.zsh) source $config;
