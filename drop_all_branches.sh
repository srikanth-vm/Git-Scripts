#!/bin/sh

git co develop
git br > branches.txt

branchArguments=""
for branch in $@; do
	branchArguments+=$branch
done

while read -r line
do
	if [[ $line == "* develop" ]] || [[ $branchArguments == *$line* ]]; then
		echo "*** $line not dropped ***"
	else
		echo "Dropping $line"
		git branch -D $line
	fi
done < "branches.txt"

rm branches.txt
fortune | cowsay
