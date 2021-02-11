#!/bin/bash

for b in U B
do
	for n in 0 1
	do
		for t in fio
		do
			for f in /tank/{0-12K,1-128K,256K,512K,1M,10M,100M,250M,500M,750M,2-1G}
			do
				for r in 1 2 3
				do
					touch "$b.$n.$t.$(basename "$f").$r.O"
				done
			done
		done
	done
done
