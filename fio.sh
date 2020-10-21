#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

for p in pre post
do
	fio \
		--readonly \
		--ioengine=psync \
		--rw=read \
		--name="$1" \
		"--filename=$1" \
		--write_bw_log \
		--write_lat_log \
		--output "fio.$(basename "$1").$p"
done
