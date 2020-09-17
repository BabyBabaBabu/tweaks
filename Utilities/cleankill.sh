#!/usr/bin/env bash

#read -p "Process name: " program

ps -ax | grep $1 | grep -v grep | awk '{print $1}' | xargs -n1 kill -9
