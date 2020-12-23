#!/usr/bin/env bash

# Visual Studio Code Update script
# Author: BabyBabaBabu &copy 2020

# check installed version
SYSVERSION=$(code --version | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")
echo -e "[+] Installed version: $SYSVERSION"

# convert to url path
URLPATH=$(code --version | grep -Eo "[0-9]+\.[0-9]+" | sed 's/\./_/')

# curl to url path and grep for update
URL_UPDATE=$(curl -sSL https://code.visualstudio.com/updates/v$URLPATH | grep -Po -m 1 '(?<=href="/updates/)[^"]*')
UPDATE_VERSION=`echo $URL_UPDATE | sed 's/_/\./' | sed 's/[A-Za-z]//'`
echo -e "[+] Update available: $UPDATE_VERSION.1"

# download update and install
echo -e "[+] Downloading..."
wget -q https://update.code.visualstudio.com/$UPDATE_VERSION.1/linux-deb-x64/stable -O code-$UPDATE_VERSION.1-stable.deb
sleep 2
echo -e "[+] Installing..."
sudo dpkg -i code-$UPDATE_VERSION.1-stable.deb
rm -f code-$UPDATE_VERSION.1-stable.deb
echo -e "[+] Installation complete!"