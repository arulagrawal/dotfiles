#!/bin/sh
tmpbg="/tmp/screen.png"
#scrot "$tmpbg"; corrupter "$tmpbg" "$tmpbg"
shotgun "$tmpbg"; corrupter -mag 1 -boffset 2 "$tmpbg" "$tmpbg"
i3lock -i "$tmpbg" -u; rm "$tmpbg"
