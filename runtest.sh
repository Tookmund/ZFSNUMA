#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test to run!"
	exit 1
fi
# Stackoverflow comes through with the nastiest of hacks
# https://stackoverflow.com/a/44248993
NUMABIND=${PWD#"${PWD%?}"}
NCTL="numactl -N $NUMABIND -m $NUMABIND "
echo $NCTL
for f in /tank/*
do
	$NCTL "$1" "$f"
done
