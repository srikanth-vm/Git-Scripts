#!/bin/bash

if [ $# -eq 0 ] || [ $# -eq 1 ]
  then
    echo "Pass head commit number and topmost commit number for squashing"
    exit
fi

git reset --hard $1
git merge --squash $2

fortune | cowsay