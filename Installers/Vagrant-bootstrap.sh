#!/usr/bin/env bash
# Custom Vagrant Boxes Bootstrap script
# It downloads my custom Vagrant files from github and provisions the VM with described Software
# Author: BabyBabaBabu &copy 2020

# User input
boxtype=$1 # Box type {Ubuntu/Centos}
providr=$2 # --provider x {virtualbox/}

function Usage(){

}

# create folder to hold the vagrant files
sudo mkdir -p `pwd`/VagrantBoxes
cd `pwd`/VagrantBoxes

# create Box specific Vagrantfile folder 
mkdir ${boxtype}
cd ${boxtype}

# Initialize and back up the original Vagrantfile
vagrant init
cp Vagrantfile Vagrantfile.orig

# Get Custom Vagrantfile from github and overwrite the Vagrantfile
curl -O https://github.com/BabyBabaBabu/DevOps/vagrant-templates/${boxtype} -o Vagrantfile #boxtype="Ubuntu/Centos"

# Validate the new Vagrantfile
vagrant validate

# Start the Box
if $providr -eq "";then
    vagrant up ${boxtype}
else
    vagrant up ${boxtype} --provider ${providr}

