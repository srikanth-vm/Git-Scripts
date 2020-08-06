#!/bin/sh

git br > branches.txt

selectedBranchNumber=0
lineNumber=1
branchName=""

while read -r line
do
    echo "$lineNumber). $line"
    lineNumber=$((lineNumber + 1))
done < "branches.txt"

read -p "Pick a branch: " selectedBranchNumber
branchName=$(sed -n "${selectedBranchNumber}p" branches.txt)
rm branches.txt

if [[ $branchName != *"* "* ]];then
    git br -D $branchName
else
    git co develop
    git br -D $branchName
fi

fortune | cowsay
