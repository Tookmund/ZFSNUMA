#!/bin/sh

for b in U
do
	for n in 0 1
	do
		for t in fio
		do
			for f in /tank/\~1G
			do
				i=0
				while [ $i -ne 25 ]
				do
					touch "$b.$n.$t.$(basename "$f").$i"
					i=$((i + 1))
				done
			done
		done
	done
done
