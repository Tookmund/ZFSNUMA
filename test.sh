#!/bin/sh

if ! [ -z $CPU ] || [ -z $MEM ]
then
	NUMACTL="numactl"
	if ! [ -z $CPU ]
	then
		NUMACTL="$NUMACTL -N $CPU "
	fi
	if ! [ -z $MEM ]
	then
		NUMACTL="$NUMACTL -m $MEM "
	fi
fi

for i in /tank/iotestfile.*
do
	dd "if=$i" of=/dev/zero

	NAME="${i##iotestfile.}"

	$NUMACTL fio \
		--readonly \
		--ioengine=psync \
		--rw=read \
		--name="$NAME" \
		"--filename=$i" \
		--output "fio.$NAME"
done
