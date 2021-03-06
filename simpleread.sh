#!/bin/bash

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

DIR="$(dirname "$0")"
NAME="$(basename "$1")"
BLOCKSIZE=4096
if [ ! -z $3 ]
then
	BLOCKSIZE="${3/M/000000}"
fi

EXE="$(basename "$0")"
EXE="${EXE/.sh/}"

for p in pre post
do
	OUT="$3$EXE.$NAME.$p$2"
	if [ -f "$OUT" ]
	then
		echo "$OUT already exists!"
		exit 1
	fi
	{
		time "$DIR/simpleread/$EXE" "$1" "$BLOCKSIZE"
	} > "$OUT" 2>&1
done
