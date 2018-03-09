#!/bin/sh

RETRY="y"
while [[ -n $RETRY ]]
do
	if [[ `git status | grep "nothing to commit"` ]]
	then
		echo "Nothing to add."
		exit
	else
		git status
	fi
	echo
	read -p 'files to add ? (press enter to skip) ' CHOIX
	if [[ -n $CHOIX ]]
	then
		git add $CHOIX
	fi
	git status
	echo
	read -p 'files to remove ? (press enter to skip) ' CHOIX
	if [[ -n $CHOIX ]]
	then
		git reset $CHOIX
	fi
	echo
	read -p 'retry ? (press enter for no, write something for yes) ' RETRY
done
git status
echo
read -p 'commit message : ' CHOIX
while [[ -z $CHOIX ]]
do
	read -p 'please write something : ' CHOIX
done
git commit -m "$CHOIX"
echo
read -p 'push branch : (press enter to master) ' CHOIX
if [[ -z $CHOIX ]]
then
	git push origin master
else
	git push origin $CHOIX
fi
