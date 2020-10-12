#!/bin/sh
for i in $@
do
	dd if=/dev/urandom of=iotestfile.$i bs=$i count=1 iflag=fullblock
done
