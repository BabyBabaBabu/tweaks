#!/usr/bin/env bash

# Vagrant update script
# Author: BabyBabaBabu &copy 2020

# check installed version
SYSVERSION=$(vagrant --version | sed -e 's/Vagrant //')
echo -e "[+] Installed version: $SYSVERSION"


# curl to url path and grep for update
UPDATE_VERSION=$(curl -sSL https://releases.hashicorp.com/vagrant/ | grep -Po -m 1 '(?<=href="/vagrant/)[^/"]*')

echo -e "[+] Update available: $UPDATE_VERSION"

# download update and install
echo -e "[+] Downloading..."
curl -sSL https://releases.hashicorp.com/vagrant/"$UPDATE_VERSION"/vagrant_"$UPDATE_VERSION"_x86_64.deb -o /tmp/vagrant-$UPDATE_VERSION.deb
sleep 2
echo -e "[+] Installing..."
sudo dpkg -i /tmp/vagrant-$UPDATE_VERSION.deb
rm -f /tmp/vagrant-$UPDATE_VERSION.deb
echo -e "[+] Installation complete!"
