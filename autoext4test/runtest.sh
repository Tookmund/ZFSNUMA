#!/bin/sh


START="$(date)"
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

END=$(date)

mail -s "Fio Ext4 Test Complete!" jaadams << EOF
Started $START
Ended $END

Results available now on archer.cs.wm.edu
EOF
