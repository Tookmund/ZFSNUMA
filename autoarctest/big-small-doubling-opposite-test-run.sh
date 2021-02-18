#!/bin/bash

for b in U B
do
	for n in 0 1
	do
		for t in smallfio bigfio
		do
			for f in /tank/{250M,500M,2-1G,2G,4G,8G,16G}
			do
				for r in 1 2 3
				do
					touch "$b.$n.$t.$(basename "$f").$r.O"
				done
			done
		done
	done
done