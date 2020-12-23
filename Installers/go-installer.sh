#!/usr/bin/env bash

# Golang Install script
# Author: BabyBabaBabu &copy 2020


# UPDATE_VERSION=$(curl -sSL https://golang.org/dl/ | grep -Po -m 1 '(?<=href="/dl/)[^"]*')
# echo $UPDATE_VERSION

# echo -e "[+] Downloading..."
# wget -q https://golang.org/dl/$UPDATE_VERSION -O /tmp/$UPDATE_VERSION.tar.gz
sleep 3

echo -e "[+] Installing..."
cd /tmp
tar -C /usr/local -xzf $UPDATE_VERSION.tar.gz
cd $HOME
if $SHELL == /bin/bash;then
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc
echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
echo "export GOPATH=$HOME/go-projects" >> $HOME/.bashrc
source $HOME/.bashrc

else if $SHELL == /bin/zsh;then
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.zshrc
echo "export GOROOT=/usr/local/go" >> $HOME/.zshrc
echo "export GOPATH=$HOME/go-projects" >> $HOME/.zshrc
source $HOME/.zshrc

fi

echo -e "[+] Installation complete!"
go version

