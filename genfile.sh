#!/bin/sh
for i in $@
do
	dd if=/dev/urandom "of=$i" "bs=$i" count=1 iflag=fullblock
done
