#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test to run!"
	exit 1
fi

if [ ! -z $NUMABIND ]
then
	NCTL="numactl -N $NUMABIND -m $NUMABIND "
fi
for f in /tank/*
do
	$NCTL "$1" "$f"
done
