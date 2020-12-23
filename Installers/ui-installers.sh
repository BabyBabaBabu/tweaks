#!/usr/bin/env bash

if dpkg -s asciinema &>/dev/null; then
	echo -e "Asciinema is installed"
else
	echo -e "Installing...:)"
	apt-get -qq install asciinema
fi

if dpkg -s lolcat &>/dev/null; then
	echo -e "Lolcat is installed"
else
	echo -e "Installing...:)"
	apt-get -qq install lolcat
fi

if dpkg -s neofetch &>/dev/null; then
	echo -e "Neofetch is installed"
else
	echo -e "Installing...:)"
	apt-get -qq install neofetch
fi
