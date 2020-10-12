#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

for p in 0 1
do
	fio \
		--readonly \
		--ioengine=psync \
		--rw=read \
		--name="$1" \
		"--filename=$1" \
		--output "fio.$p.$(basename "$1")"
done
