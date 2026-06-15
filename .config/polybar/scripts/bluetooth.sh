#!/bin/bash

power=$(bluetoothctl show | grep -q "Powered: yes" && echo "on" || echo "off")

if [[ "$power" == "off" ]]; then
    echo "off"
    exit 0
fi

# Get connected device names
connected=$(bluetoothctl devices Connected | cut -d' ' -f3-)

if [[ -z "$connected" ]]; then
    echo "on"
else
    echo "$connected"
fi
