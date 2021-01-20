#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

NAME="$(basename "$1")"

fio \
	--readonly \
	--invalidate=0 \
	--ioengine=psync \
	--rw=read \
	--name "$NAME" \
	--filename "$1" \
	--minimal \
	--output "fio.$NAME$2"
