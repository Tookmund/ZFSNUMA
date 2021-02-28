#!/bin/bash

for b in U B
do
	for n in 0 1
	do
		for t in simpleread
		do
			for f in /tank/{250M,500M,2-1G,2G,4G}
			do
				for r in 1 2 3
				do
					for bs in 1M
					do
						touch "$b.$n.$t.$(basename "$f").$r.O.$bs"
					done
				done
			done
		done
	done
done
