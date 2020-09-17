#!/usr/bin/env bash

if dpkg -s asciinema &>/dev/null; then
	echo -e "Asciinema is installed"
else
	echo -e "Installing...:)"
	apt-get -qq install asciinema
fi
