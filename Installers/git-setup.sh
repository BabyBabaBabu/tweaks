#!/usr/bin/env bash

#NOTIFICATION COLORS
ORANGE="\033[0;33m"
RED="\033[0;31m"
LGREEN="\033[1;32m"
LRED="\033[1;31m"
LCYAN="\033[1;36m"
LGRAY="\033[0;37m"
YELLOW="\033[1;33m"


function quit()
{
	echo -e "$LRED \n\n\t\tQuiting... :-("
	rm -rf .git/
	exit 0
}
trap quit SIGINT

if [ $UID -ne 0 ]; then

	echo -e "$RED You need to be root to run Script"
	exit 1
fi

clear
echo -e "\n\n"
echo -e "$LCYAN \t\t\tGit Installation and Configuration Script"

echo -e "$LGREEN Checking If Git is Installed"
sleep 2

if dpkg -s git &>/dev/null; then
	echo -e "$LGRAY Git is already installed :)"
else
	echo -e "$YELLOW Installing...:)"
	sleep 2
	apt-get -qq install git

	echo -e "$LGRAY Installation complete...:)"

fi

echo -e "$LRED"
read -p "Proceed with Configuration ? (Y/N)" setUp

if [[ $setUp = "Y" || $setUp = "y" ]]; then
	sleep 2
	
	echo -e "$LGREEN "
	read -p "Enter your GitHub account username: " UNAME
	git config --global user.name $UNAME
	echo -e "$LGREEN "
	read -p "Enter your email address: " EMAIL
	git config --global user.email $EMAIL

	echo -e "$LGREEN"
	read -p "Colorize output ? (Y/N)" setColor
	if [[ $setColor = "Y" || $setColor = "y" ]]; then
		git config --global color.ui true
	else
		git config --global color.ui false
	fi

	echo -e "$LGREEN"	
	echo -e "$LGREEN\nFollowing is your configuration"
	git config --global --list
	
	echo -e "$YELLOW"
	sleep 2
	echo -e "Initializing the local repository\n"
	git init
	touch README.md .gitignore
	git add README.md
	git add .gitignore
	git commit -m "first commit"
	git branch -M master
	
	echo -e "\nAdding the remote GitHub repository"
	read -p "Paste the remote repository: " REPO
	git remote add origin $REPO
	echo -e "Uploading local repo to remote repo"
	git push -u origin master

	
	sleep 2
	echo -e "$ORANGE\nDone, Happy Coding...:-)"
	
elif [[ $setUp = "N" || $setUp = "n" ]]; then
	echo -e "$ORANGE Maybe another time, bye... :-( "
	exit 0	
else 
	echo -e "Unknown option"
	exit 1
fi
