#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

for p in 0 1
do
	{
		time nice -n -1 dd "if=$1" of=/dev/null
	} > "dd.$p.$(basename "$1")" 2>&1
done
