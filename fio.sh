#!/bin/sh
for i in pre post
do
	fio \
		--readonly \
		--ioengine=psync \
		--rw=read \
		--name="$1" \
		"--filename=$1" \
		--output "fio.$1.$i"
done
