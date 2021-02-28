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

for p in pre post
do
	{
		time "$DIR/simpleread/simpleread" "$1" "$BLOCKSIZE"
	} > "$3simpleread.$NAME.$p$2" 2>&1
done
