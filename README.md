# Raspberry Pi 3 for controlling olimex ice40HX8K (programming, JTAG, UART)

This document describes how to configure a Raspberry Pi 3 to program the [lattice ice40HX8K fpga board from olimex](https://www.olimex.com/Products/FPGA/iCE40/iCE40HX1K-EVB/open-source-hardware).

See also:

[1] [olimex webiste, iceprog](https://www.olimex.com/wiki/ICE40HX1K-EVB#Iceprog_with_Raspberry_PI)

[2] [Using a Raspberry Pi as a JTAG Dongle](https://github.com/synthetos/PiOCD/wiki/Using-a-Raspberry-Pi-as-a-JTAG-Dongle)

[3] [Schematic Raspberry Pi 3B](https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3b_1p2_reduced.pdf)

[4] [Schematic olimex iCE40HX9K-EVB](https://github.com/OLIMEX/iCE40HX8K-EVB/blob/master/HARDWARE/REV-B/iCE40HX8K-EVB_Rev_B.pdf)

## Preparing Rasperry Pi 3

1. format sd card with [sd memory card formatter] (https://www.sdcard.org/downloads/formatter_4/)
2.Download the [NOOBS](https://www.raspberrypi.org/downloads/noobs/) zip file, extract and put content on sd card
3. Insert card and boot raspberry pi 3
4. Login -> Default username: pi, password: raspberry
5. Enable ssh -> sudo raspi-config -> interface options -> enable ssh
6. Enable spi -> sudo raspi-config -> interface options -> enable spi

## Installation

Run the install.sh

## Cabeling

### Power

The Olimex is powered with a dedicated 5V power supply
(alternatively the Olimex can be powered from the 5V of the Raspi)
The Raspi with the Micro USB

### Ground

We connect the following Pins

Olimex: GPIO1 Connector, Pin 2 (GND)
Raspi:  J8    Connector, Pin 39 (GND)

### SPI

We have to connect the MISO, MOSI, and Clock

#JTAG

..
