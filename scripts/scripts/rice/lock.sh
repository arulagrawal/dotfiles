#!/bin/bash
tmpbg="/tmp/screen.png"
#scrot "$tmpbg"; corrupter "$tmpbg" "$tmpbg"
scrot "$tmpbg"; corrupter -mag 1 -boffset 2 "$tmpbg" "$tmpbg"
i3lock -i "$tmpbg" -u; rm "$tmpbg"
