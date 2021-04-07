#!/bin/sh


START="$(date)"
for f in /scratch/jaadams/*
do
	for b in 1K 2K 4K 8K 16K 32K 64K
	do
		for r in 1 2 3
		do
			./autotest.sh "$f" "$b" "$r"
		done
	done
done

END=$(date)

mail -s "Fio Small Ext4 Test Complete!" jaadams << EOF
Started $START
Ended $END

Results available now on archer.cs.wm.edu
EOF
