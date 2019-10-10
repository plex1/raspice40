#!/bin/bash
killbg() {
        echo "start kill subprocesses"
        for p in "${pids[@]}" ; do
                kill "$p";
        done
	echo "killed subprocesses"
}

trap killbg EXIT
pids=()

serialno="$(./get_usb_serial.sh /dev/ttyUSB0)"

if [ "${serialno}" == "AC00CLDA" ]; then
    
    ./start_uart_server.sh /dev/ttyUSB1 9600 9802&
    pids+=($!)

    ./start_uart_server.sh /dev/ttyUSB0 115200 9801&
    pids+=($!)

else

    ./start_uart_server.sh /dev/ttyUSB0 9600 9802&
    pids+=($!)

    ./start_uart_server.sh /dev/ttyUSB1 115200 9801&
    pids+=($!)
    
fi

sleep 5

read  -n 1 -p "quit with any key.." mainmenuinput

killbg


