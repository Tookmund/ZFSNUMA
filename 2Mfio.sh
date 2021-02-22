#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

NAME="$(basename "$1")"

for p in pre post
do
	fio \
		--readonly \
		--invalidate=0 \
		--ioengine=psync \
		--rw=read \
		--name "$NAME" \
		--filename "$1" \
		--output-format=json \
		--bs=2M \
		--output "2Mfio.$NAME.$p$2"
done
