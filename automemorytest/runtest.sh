#!/bin/sh

for b in 250M 500M 1G 2G 4G 8G 16G
do
	for CPU in 0 1
	do
		for MEM in 0 1
		do
			numactl -N $CPU -m $MEM ../simplememory.sh "$b" "C$CPU.M$MEM.R$1"
		done
	done
done

