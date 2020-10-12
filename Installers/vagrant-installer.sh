#!/usr/bin/env bash

# Vagrant installer script
# Author: BabyBabaBabu &copy 2020

export DEBIAN_FRONTEND=noninteractive
# Global Variables
OS_TYPE=
PACKAGE_CHECKER=
PACKAGE_INSTALLER=
SYS_UPDATER=


# Check O.S Version & substitute package managers 
function sysCheck(){

    if [ -f /etc/os-release ]; then
        source /etc/os-release
        OS_TYPE=$ID
    elif [ -f /etc/redhat-release ]; then
        OS_TYPE="$(awk '{ print tolower($1) }' /etc/redhat-release | sed 's/"//g')"
    fi

    if [[ "$OS_TYPE" -eq "debian" || "$OS_TYPE" -eq "elementary" || "$OS_TYPE" -eq "linuxmint" || "$OS_TYPE" -eq "ubuntu" || "$OS_TYPE" -eq "kali" ]];then
        PACKAGE_CHECKER="sudo dpkg -s" 
        PACKAGE_INSTALLER="sudo dpkg -i"
        SYS_UPDATER="sudo apt"
    elif [[ "$OS_TYPE" -eq "centos" || "$OS_TYPE" -eq "ol" || "$OS_TYPE" -eq "fedora" ]]; then
        PACKAGE_CHECKER="sudo rpm -q"
        PACKAGE_INSTALLER="sudo yum localinstall"
        SYS_UPDATER="sudo yum"
    fi
}

# Download & Install Vagrant
function getVagrant(){

    URL=https://releases.hashicorp.com/vagrant/
    LATEST_VERSION=$(curl -sSL https://releases.hashicorp.com/vagrant/ | grep -Po -m 1 '(?<=href="/vagrant/)[^/"]*')
    echo -e "[+]\tLatest Vagrant Version Available: $LATEST_VERSION"
	read -sn 1 -p "Press any key to continue..."
    sleep 3
    curl -sSL https://releases.hashicorp.com/vagrant/"$LATEST_VERSION"/vagrant_"$LATEST_VERSION"_x86_64.deb -o /tmp/vagrant-update.deb
    echo -e "Installing..."
    sleep 3
    $PACKAGE_INSTALLER /tmp/vagrant-update.deb
    
    if $? -eq 0;then
        sudo rm /tmp/vagrant-update.deb
        # Enable Autocompletion
        echo -e "[+]\tEnabling autocompletion"
        vagrant autocomplete install --bash --zsh
        sleep 2
        echo -e "[+]\tInstallation complete!"
    fi
}

sysCheck
if $PACKAGE_CHECKER vagrant &> /dev/null;then
    echo -e "[+]\tVagrant is already installed!"
else
    getVagrant
fi
