#!/usr/bin/env bash

remotehost=$2
user=$1

function usage(){
	echo -e "$0 - autogenerate ssh keys for passwordless login to a host"
	echo -e "Usage:\t./$0 [ruser] [rhost]"
	echo -e "\truser - remote user account"
	echo -e "\trhost - remote host machine"

}

function autolog(){

	ssh-keygen -t rsa -b 4096 -N "" -f ${remotehost} &> /dev/null

	echo -e "[+]\tKeys generated here `pwd`"
	ls -l | grep ${remotehost}
	echo -e "[+]\tCopying public key to ${remotehost}"
	ssh-copy-id -i ${remotehost}.pub ${user}@${remotehost}

}

#if no argument passed; print usage; else generate keys
if [[ $# -eq 0 || $# -lt 2 ]] ; then
	usage
	exit 1
else
	autolog
fi





