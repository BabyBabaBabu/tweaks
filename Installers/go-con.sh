#!/usr/bin/env bash

PROJECT=$1
# echo $PROJECT
# locate gopath for projects
DIR=`go env GOPATH | awk -FS":" '{print $1}'`
# create new workspace for project
mkdir -p $DIR/src/github.com/BabyBabaBabu/$PROJECT