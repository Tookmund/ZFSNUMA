#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 41
fi

NAME="$(basename "$1")"
BLOCKSIZE="4096"

if [ ! -z $3 ]
then
	BLOCKSIZE="$3"
fi

for p in pre post
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
