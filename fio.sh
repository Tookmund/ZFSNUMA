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
		--ioengine=psync \
		--rw=read \
		--name "$NAME" \
		--filename "$1" \
		--write_bw_log "$NAME.$p" \
		--write_lat_log "$NAME.$p" \
		--output "fio.$NAME.$p"
done
