#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

echo "Programming FPGA.."
echo 24 > /sys/class/gpio/export 
echo out > /sys/class/gpio/gpio24/direction
dd if="$1" conv=notrunc of=image 
dd if=/dev/null of=image bs=1 count=1 seek=2M
flashrom/flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=20000 -w image
echo in > /sys/class/gpio/gpio24/direction
echo "..done"
