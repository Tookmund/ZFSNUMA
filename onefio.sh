#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

NAME="$(basename "$1")"

fio \
	--readonly \
	--ioengine=psync \
	--rw=read \
	--name "$NAME" \
	--filename "$1" \
	--output "fio.$NAME$2"
