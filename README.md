# Raspberry Pi 3 for controlling olimex ice40HX8K (programming, JTAG, UART)

This document describes how to configure a Raspberry Pi 3 (Raspi) to program the [lattice ice40HX8K fpga board from olimex](https://www.olimex.com/Products/FPGA/iCE40/iCE40HX1K-EVB/open-source-hardware) (Oli).

Sources:

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

## Cabeling

### Power

The Raspi is powered with a 5V Micro USB cable
The Oli is powered with a dedicated 5V power supply
(alternatively the Olimex can be powered from the 5V of the Raspi)

### Ground

The Grounds of the two boards need to be connected. See SPI.

### SPI

We have to connect the following pins for JTAG. Ground is connected via this JTAG.

Raspi Connector: J8\
Oli Connector: PGM1

| Raspi pin name/num  | Oli pin name/num |
| ------------------- | -----------------|
| SCK / 23            | SCK / 9          |
| MISO / 21           | SDI / 7          |
| MOSI / 19           | SDO / 8          |
| CE0 / 24            | SS_B / 10        |
| GPIO25 / 22         | CDONE / 5        |
| GND / 20            | GND / 2          |
| GPIO24 / 18         | CRESET / 6       |

### JTAG

We have to connect the following pins for JTAG. Reset is not unused.

Raspi Connector: J8\
Oli Connector: GPIO1

| Raspi pin name/num  | Oli pin name/num    |
| ------------------- | ------------------- |
| TCK / 35            | TCK / 31            |
| TMS / 36            | TMS / 32            |
| TDI / 37            | TDI / 33            |
| TDO / 38            | TDO / 34            |
| RST / 40            | optional            |

### UART

UART can be used to talk to the FPGA.

Raspi Connector: J8\
Oli Connector: GPIO1

| Raspi pin name/num  | Oli pin name/num    |
| ------------------- | ------------------- |
| Tx / 8              | Rx / e.g. 28        |
| Rx / 10             | Tx / e.g. 27        |


## Installation

For installing the tools run the script:
```sh install.sh```

## Programming

To prgram the FPGA run the script:
```program.sh programming_file.bin```

The programming file can be generated with the [yosys suite](http://www.clifford.at/yosys/), see also [SpinalDev](https://github.com/plex1/SpinalDev)).

## JTAG Server

To start the openocd server run:
```openocd.sh```

JTAG can be used to program and debug software (see for example [SpinalDev](https://github.com/plex1/SpinalDev))

## UART

Make sure uart is enabled in the configuration (```sudo raspi-config```) and mincom is installed (```sudo apt-get install minicom```). Now access of uart may be done with:
```
minicom -b 115200 -o -D /dev/ttyAMA0
```
