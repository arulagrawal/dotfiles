#!/bin/bash
connect(){
    echo -e "power on\nconnect 6C:56:97:2F:96:AE\n" | bluetoothctl
    sleep 2
    echo -e "connect 6C:56:97:2F:96:AE\n" | bluetoothctl > /dev/null
    #change spotify to bluetooth
    spotify_id=$(pactl list sink-inputs | grep -B 16 "media.role = \"music\"" | grep "Sink Input #" | awk '{print $3}' | sed -r 's/#//')
    sleep 4
    echo_sink=$(pactl list sinks | grep "Name: bluez_sink" | awk '{print $2}')
    pactl move-sink-input "$spotify_id" "$echo_sink"
}

disconnect(){
    echo -e "power off\n" | bluetoothctl
}

sinkid=$(pamixer --list-sinks | grep "bluez" | awk '{print $1}')
if [[ -z $sinkid ]]
then
    connect
else
    disconnect
fi
