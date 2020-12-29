#!/usr/bin/env bash

PROJECT=$1
# echo $PROJECT
# locate gopath for projects
DIR=`go env GOPATH | awk -F":" '{print $2}'`
# echo $DIR
# create new workspace for project
mkdir -p $DIR/src/github.com/BabyBabaBabu/$PROJECT

if [ $? -eq 0 ];then
    echo -e "[+] Done, Happy Hacking!! :-)"
else
    echo -e "[!] Set up failed; something went wrong :-("
fi