#!/bin/sh
for i in $@
do
	dd if=/dev/urandom "of=$i" "bs=$(basename "$i")" count=1 iflag=fullblock
done
