#!/bin/bash

for b in U B
do
	for n in 0 1
	do
		for t in fio
		do
			for f in /tank/{0-12K,1-128K,500M,2-1G,2G,4G,8G,16G}
			do
				touch "$b.$n.$t.$(basename "$f")"
			done
		done
	done
done
