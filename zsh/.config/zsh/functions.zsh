#   ████                            ██   ██
#  ░██░                            ░██  ░░
# ██████ ██   ██ ███████   █████  ██████ ██  ██████  ███████   ██████
#░░░██░ ░██  ░██░░██░░░██ ██░░░██░░░██░ ░██ ██░░░░██░░██░░░██ ██░░░░
#  ░██  ░██  ░██ ░██  ░██░██  ░░   ░██  ░██░██   ░██ ░██  ░██░░█████
#  ░██  ░██  ░██ ░██  ░██░██   ██  ░██  ░██░██   ░██ ░██  ░██ ░░░░░██
#  ░██  ░░██████ ███  ░██░░█████   ░░██ ░██░░██████  ███  ░██ ██████
#  ░░    ░░░░░░ ░░░   ░░  ░░░░░     ░░  ░░  ░░░░░░  ░░░   ░░ ░░░░░░

pa()
{
    [ ! -f "$1" ] && echo "give a file name" && return 1
    curl --netrc-file ~/.config/.netrc -sF "file=@$1" "https://arul.io" | tee >(pbcopy)
}

pad()
{
    curl --netrc-file ~/.config/.netrc -X DELETE "https://arul.io/$1"
}

#fzf with preview options
fzfp()
{
    fzf --reverse --inline-info --preview='[[ $(file --mime {}) =~ binary ]] &&
                  echo {} is a binary file ||
                  highlight --style base16/nord -O ansi -l {} ||
                  cat {} 2> /dev/null | head -500' --bind '?:toggle-preview' --tabstop=1 --ansi --delimiter / --with-nth -1
}

#quick lookup for my config files
dots()
{
    find ~/dotfiles -type f | awk '!/git|after|lua|.DS_Store/'| fzfp | xargs $EDITOR;
}

#show me what my key config looks like - pressing enter goes to that command in the config
keys()
{
    awk '/^[a-zA-Z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/sxhkd/sxhkdrc | column -t -s $'\t' | fzf --reverse | awk -F\# '{print $1}' | sed -e "s/ *$//" | xargs -I cmd nvim +/cmd ~/.config/sxhkd/sxhkdrc;
}

dec2bin ()
{
    echo "obase=2; $1" | bc
}

bin2dec ()
{
    echo "ibase=2; $1" | bc
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
    if [ $# -eq 0 ]; then
        clear
    elif [ -d "$1" ]; then
        cd "$1"
    elif [ -f "$1" ]; then
        cat "$1"
    fi
}

shorten()
{
    curl -F"shorten=$*" https://0x0.st
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

swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

comp()
{
    [ -f "a.out" ] && rm a.out
    g++ -std=c++2a $1
    ./a.out
    rm a.out
}

mkcd()
{
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "\`$1' already exists"
    else
        mkdir $1 && cd $1
    fi
}

cl()
{
    cd "$@" && ls
}

'$'()
{
    "${@}"
}

java8()
{
    export PATH="/Users/arul/.jenv/shims:${PATH}"
    export JENV_SHELL=zsh
    export JENV_LOADED=1
    unset JAVA_HOME
    source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
    jenv rehash 2>/dev/null
    jenv refresh-plugins
    source "/Users/arul/.jenv/plugins/export/etc/jenv.d/init/export_jenv_hook.zsh"
    jenv() {
      typeset command
      command="$1"
      if [ "$#" -gt 0 ]; then
        shift
      fi

      case "$command" in
      enable-plugin|rehash|shell|shell-options)
        eval `jenv "sh-$command" "$@"`;;
      *)
        command jenv "$command" "$@";;
      esac
    }
}
