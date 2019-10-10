#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "ex. ./get_usb_serial.sh /dev/ttyUSB0"
    exit 1
fi

udevadm info --name="$1" --attribute-walk | grep "ATTRS{serial}" | head -n 1 | grep -o '".*"' | sed 's/"//g'

