#!/usr/bin/env bash

SRC=`pwd`

git clone https://github.com/udoyen/wps-fonts.git

cd $SRC/wps-fonts/wps

sudo mv *.ttf /usr/share/fonts/wps-office
sudo mv *.TTF /usr/share/fonts/wps-office

cd $SRC

sudo rm -R $SRC/wps-fonts

echo -e "[+] WPS Extra Fonts installed successfully!"

echo -e "[+] Installing Microsoft TrueType Fonts..."

sudo apt-get install msttcorefonts
sudo apt-get install ttf-mscorefonts-installer

sleep 5

echo -e "[+] Installation completed!"
