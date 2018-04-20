#!/bin/bash

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
		git reset -- $CHOIX
		git status
	fi
	echo
	read -n 1 -p 'retry ? (press enter for no, something for yes) ' RETRY
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
read -p 'push branch : (press enter to actual branch) ' CHOIX
if [[ -z $CHOIX ]]
then
	BRANCH = `git branch | grep "*" | cut -c3-`
	echo $BRANCH
else
	git push origin $CHOIX
fi
