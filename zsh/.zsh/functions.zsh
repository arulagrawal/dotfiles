#   ████                            ██   ██                          
#  ░██░                            ░██  ░░                           
# ██████ ██   ██ ███████   █████  ██████ ██  ██████  ███████   ██████
#░░░██░ ░██  ░██░░██░░░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██ ██░░░░ 
#  ░██  ░██  ░██ ░██  ░██░██  ░░   ░██  ░██░██   ░██ ░██  ░██░░█████ 
#  ░██  ░██  ░██ ░██  ░██░██   ██  ░██  ░██░██   ░██ ░██  ░██ ░░░░░██
#  ░██  ░░██████ ███  ░██░░█████   ░░██ ░██░░██████  ███  ░██ ██████ 
#  ░░    ░░░░░░ ░░░   ░░  ░░░░░     ░░  ░░  ░░░░░░  ░░░   ░░ ░░░░░░  

twitch()
{
    streamlink --player=mpv https://www.twitch.tv/"$1" "$2" & disown
}

#fzf with preview options
fzfp()
{
    fzf --reverse --inline-info --preview='[[ $(file --mime {}) =~ binary ]] &&
                  echo {} is a binary file ||
                  highlight --style="base16/dracula" -O ansi -l {} ||
                  cat {} 2> /dev/null | head -500' --bind '?:toggle-preview' --tabstop=1 --ansi
}


#quick lookup for my config files
function dots()
{
    find ~/dotfiles/ -type f -exec du -a {} + | awk '{print $2}' | sed '/git\|autoload\|generate.vim\|netrwhist\|python.vim\|bash\|plugged\|xrdb/d' | fzfp | xargs -r $EDITOR;
}

#show me what my key config looks like - pressing enter goes to that command in the config
keys()
{
    awk '/^[a-zA-Z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/sxhkd/sxhkdrc | column -t -s $'\t' | fzf --reverse | awk -F\# '{print $1}' | sed -e "s/ *$//" | xargs -I cmd nvim +/cmd ~/.config/sxhkd/sxhkdrc;
}

hex2dec()
{
    echo $((16#$1));
}

dec2hex()
{
    echo "obase=16; $1" | bc;
}

c()
{
    if [ $# -eq 0 ] ; then
        clear
    elif [ -d "$1" ] ; then
        cd "$1"
    elif [ -f "$1" ] ; then
        cat "$1"
    fi
}

shorten()
{
    curl -F"shorten=$*" https://0x0.st
}

zathura()
{
    command zathura "$@" & disown
}

spawn()
{
    "$@" & disown
}

pdfcombine()
{
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="combinepdf".pdf "$1" "$2"
}

archive()
{
    local format="$1"
    local output="$2"
    local input=( "${@:3}" )
    case "$format" in
        tar )
            tar -czvf "${output}.tar.gz" "${input[@]}";;
        7z )
            7za a "${output}.7z" "${input[@]}";;
    esac
}
