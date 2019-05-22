#!/bin/bash
mapfile -t current < <(bspc query --nodes --desktop focused)
bspc monitor --focus next
mapfile -t next < <(bspc query --nodes --desktop focused)
bspc monitor --focus next
echo "${current[@]}"
echo "${next[@]}"
