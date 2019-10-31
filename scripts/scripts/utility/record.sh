#!/bin/sh
#
# stolen from http://github.com/mitchweaver/bin
#
# record a selected rectangle with ffmpeg
#
# deps: ffmpeg, slop

mkdir -p /tmp/record
sock=/tmp/record/sock
pidfile=/tmp/record/pidfile
rate=30
die() { >&2 echo "$*" ; exit 1 ; }
isrunning() {
    [ -f $pidfile ] && [ -e /proc/$(cat $pidfile) ]
    return $?
}
stop() {
    if isrunning; then
        echo q >> $sock
        rm -r /tmp/record
    else
        die "Nothing being recorded."
    fi
    die "done"
}

case "$1" in
    *h|*help)
cat << "EOF"
record:
---------
(no args)  -  record
stop|-s    -  end recording
toggle|-t  -  active/paused
EOF
        ;;
    *s|*stop)
        stop
        ;;
    *t|*toggle)
        isrunning || die "Nothing being recorded."
        pid=$(cat $pidfile)
        case $(command ps -o state= $pid) in
            S) kill -s STOP $pid ; echo "Pausing..." ;;
            T) kill -s CONT $pid ; echo "Resuming..."
        esac
        ;;
    *)
        if isrunning; then
            stop
            die
            exit
        fi
        isrunning && die "Another instance already exists."
        isrunning && stop
        echo > $sock
        set -- $(slop -q -o -f '%x %y %w %h')

        # NOTE: need this for mp4s to play in firefox, requires ffmpeg 4.0.2+ "-pix_fmt yuv420p"
        #       note-note: this is breaking script for some people if added?
        <$sock ffmpeg -y -f x11grab -s ${3}x${4} \
            -r $rate -i ${DISPLAY:=:0.0}+${1},${2} -vcodec libx264 \
            "~/videos/screens/$(date '+%F-%T').mp4" > /tmp/record/log \
                                                2> /tmp/record/err_log &

        # set to the last core, (helps when recording games that are single threaded)
        taskset -pc $(($(nproc) - 1)) $! > /dev/null
        # set our resource priority to be last
        renice 999 $! > /dev/null

        echo "* recording on pid $!"
        echo $! > $pidfile
esac
