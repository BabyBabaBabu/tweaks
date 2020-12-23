#!/usr/bin/env bash

# Visual Studio Code Install script
# Author: BabyBabaBabu &copy 2020

# start by checking if update exists
SEED_URL="https://code.visualstudio.com/updates/v1_50"
UPDATE=$(curl -sSL $SEED_URL | grep -Po -m 1 '(?<=href="/updates/)[^"]*')
UPDATE_VERSION=`echo $UPDATE | sed 's/_/\./' | sed 's/[A-Za-z]//'`

echo -e "[+] Downloading latest version $UPDATE_VERSION.1 ..."
wget -q https://update.code.visualstudio.com/$UPDATE_VERSION.1/linux-deb-x64/stable -O code-$UPDATE_VERSION.1-stable.deb
sleep 3
echo -e "[+] Installing..."
sudo dpkg -i code-$UPDATE_VERSION.1-stable.deb
rm -f code-$UPDATE_VERSION.1-stable.deb
echo -e "[+] Installation complete!"