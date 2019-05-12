#!/bin/sh
connect(){
    echo -e "power on\nconnect 6C:56:97:2F:96:AE\n" | bluetoothctl
}

disconnect(){
    echo -e "power off\n" | bluetoothctl
}

sinkid=$(pamixer --list-sinks | grep "bluez" | awk '{print $1}')
if [[ -z $sinkid ]]
then
    connect
    sleep 2
    connect > /dev/null
else
    disconnect
fi
