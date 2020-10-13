#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

for p in pre post
do
	{
		sudo nice -n -1 time dd "if=$1" of=/dev/null
	} > "dd.$(basename "$1").$p" 2>&1
done
