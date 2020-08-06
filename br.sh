#!/bin/sh

if [ $# -eq 0 ];then
    git br > branches.txt
else
    git br | grep $1 > branches.txt
fi

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

if [[ $branchName != *"* "* ]];then
    git co $branchName
else
    echo "Cant switch to the same branch you are on."
fi

rm branches.txt
fortune | cowsay
