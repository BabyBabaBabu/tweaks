#!/usr/bin/env bash

# Golang Install script
# Author: BabyBabaBabu &copy 2020


UPDATE_VERSION=$(curl -sSL https://golang.org/dl/ | grep -Po -m 3 '(?<=href="/dl/)[^"]*' | grep "linux")
echo -e "[+] Found version: $UPDATE_VERSION"

echo -e "[+] Downloading..."
wget -q https://golang.org/dl/$UPDATE_VERSION -O /tmp/$UPDATE_VERSION
sleep 3

echo -e "[+] Installing..."

cd /tmp
sudo tar -C /usr/local -xzf $UPDATE_VERSION
cd $HOME

# Setting up enviroment variables
if [ $SHELL == "/bin/bash" ];then
    # echo "using bash"
    echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
    echo "export PATH=$PATH:$GOROOT/bin" >> $HOME/.bashrc
    mkdir -p $HOME/golib/bin
    echo "export GOPATH=$HOME/golib" >> $HOME/.bashrc
    echo "export PATH=$PATH:$GOPATH/bin">> $HOME/.bashrc
    mkdir -p $HOME/go-projects
    echo "export GOPATH=$HOME/go-projects" >> $HOME/.bashrc
    
    source $HOME/.bashrc
elif [ $SHELL == "/bin/zsh" ];then
    # echo "using zsh"
    echo "export GOROOT=/usr/local/go" >> $HOME/.zshrc
    echo "export PATH=$PATH:$GOROOT/bin" >> $HOME/.zshrc
    mkdir -p $HOME/golib/bin
    echo "export GOPATH=$HOME/golib" >> $HOME/.zshrc
    echo "export PATH=$PATH:$GOPATH/bin" >> $HOME/.zshrc
    mkdir -p $HOME/go-projects
    echo "export GOPATH=$GOPATH:$HOME/go-projects" >> $HOME/.zshrc
    
    source $HOME/.zshrc
fi

sudo rm /tmp/$UPDATE_VERSION
echo -e "[+] Installation complete!"
go version

