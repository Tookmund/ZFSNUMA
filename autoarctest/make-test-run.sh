#!/bin/sh


for b in  O
do
	for n in 0 1
	do
		for t in fio
		do
			for f in /tank/*
			do
				touch "$b.$n.$t.$(basename "$f")"
			done
		done
	done
done
