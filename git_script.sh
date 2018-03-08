#!/bin/sh

git status

echo
read -p 'files to add ? (press enter to skip) ' choix

if [[ -n $choix ]]
then
	git add $choix
fi

git status

echo
read -p 'files to remove ? (press enter to skip) ' choix

if [[ -n $choix ]]
then
	git reset $choix
fi

git status

echo
read -p 'commit message : ' choix

while [[ -z $choix ]]
do
	read -p 'please write something : ' choix
done

git commit -m "$choix"

echo
read -p 'push branch : (press enter to master) ' choix
if [[ -n $choix ]]
then
	git push origin master
else
	git push origin $choix
fi
