#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "ex. ./start_uart_server /dev/ttyUSB0 115200 9801"
    exit 1
fi

echo "Starting UART Server.."
# turn of echo and raw mode
stty raw -echo -F "$1" "$2"
nc -k -l "$3" < "$1" > "$1"
echo "..done"
