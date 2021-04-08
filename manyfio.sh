#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 41
fi

NAME="$(basename "$1")"
BLOCKSIZE="4096"
OPPOSITE="$(basename "$(pwd)")"

if [ ! -z $3 ]
then
	BLOCKSIZE="$3"
fi

RUNS="one"
if [ "$OPPOSITE" = "O" ]
then
	RUNS="zero one two three four five"
fi

for p in $RUNS
do
	FILENAME="$3fio.$NAME.$p$2"

	if [ -f "$FILENAME" ]
	then
		echo "ERROR: $FILENAME exists!"
		exit 42
	fi
	fio \
		--readonly \
		--invalidate=0 \
		--ioengine=psync \
		--rw=read \
		--name "$NAME" \
		--filename "$1" \
		--output-format=json \
		"--bs=$BLOCKSIZE" \
		--output "$FILENAME"
done
