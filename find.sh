#!/bin/sh

if [[ ($1 != ~/* && $1 != /* && $1 != ./*) || $2 == "" ]]
then
	echo "usage: find start[/, ~/, ./][path] [\"word_to_find\"]"
	if [[ ($1 != ~/* && $1 != /* && $1 != ./*) && $2 == "" ]]
	then
		echo "\n[word_to_find] options:"
		echo "	- Use '*' to replace a string"
		echo "	- Use '?' to replace a letter"
	fi
else
	find $1 -iname $2 -print 2>/dev/null
fi
