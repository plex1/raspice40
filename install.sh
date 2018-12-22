sudo apt-get update
sudo apt-get install emacs

#install flashgit
clone https://www.flashrom.org/git/flashrom.git
cd flashrom
sudo make CONFIG_ENABLE_LIBPCI_PROGRAMMERS=no CONFIG_ENABLE_LIBUSB0_PROGRAMMERS=no CONFIG_ENABLE_LIBUSB1_PROGRAMMERS=no install

chmod +x program.sh

sudo apt-get install git autoconf libtool make pkg-config libusb-1.0-0 libusb-1.0-0-dev telnet
sudo apt-get install libtool automake libusb-1.0.0-dev texinfo libusb-dev libyaml-dev pkg-config
git clone https://github.com/SpinalHDL/openocd_riscv.git
cd openocd_riscv/
./bootstrap
./configure --enable-ftdi --enable-dummy --enable-maintainer-mode --enable-bcm2835gpio --enable-sysfsgpio
make
sudo make install

chmod +x openocd.sh
