#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Pass a keyword to search for in remote branches."
    exit
fi

git fetch
git br -r | grep $1 > branches.txt

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
localBranchName=$(echo $branchName | sed "s/origin\///g")

git co $localBranchName

rm branches.txt
fortune | cowsay
