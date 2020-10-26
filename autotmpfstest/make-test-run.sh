#!/bin/sh

for n in 0 1
do
	for f in 12K 128K 1M 500M 1G 2G 4G 8G 16G
	do
		touch "$n.onefio.$(basename "$f")"
	done
done
