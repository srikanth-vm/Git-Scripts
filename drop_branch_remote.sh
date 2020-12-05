
#!/bin/bash

if [ $# -eq 0 ] 
  then
	echo "Pass atleast one branch name to delete"
	exit
fi

for var in "$@"
do
	git branch -D $var
	git push origin :$var
done

fortune | cowsay