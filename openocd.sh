#!/bin/sh

sudo openocd_riscv/src/openocd -f ./raspberrypi3-spinal.cfg -c "set MURAX_CPU0_YAML /home/pi/raspice40/cpu0.yaml" -f openocd_riscv/tcl/target/murax.cfg 
