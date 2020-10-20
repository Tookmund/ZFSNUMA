#!/bin/sh


for b in U B
do
	for n in 0 1
	do
		for t in dd fio
		do
			for f in /tank/*
			do
				touch "$b.$n.$t.$(basename "$f")"
			done
		done
	done
done
