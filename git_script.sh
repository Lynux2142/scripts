#!/bin/sh

RETRY="y"
while [[ -n $RETRY ]]
do
	git status
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
	read -p 'do you want to retry ? (press enter for no, write something for yes) ' RETRY
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
	echo BONJOUR
	git push origin master
else
	git push origin $CHOIX
fi
