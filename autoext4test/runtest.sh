#!/bin/sh


for f in /scratch/jaadams/*
do
	for b in 128K 256K 512K 1M 2M 4M 8M
	do
		for r in 1 2 3
		do
			./autotest.sh "$f" "$b" "$r"
		done
	done
done
