#!/bin/bash

TESTTYPE="$1"
SCRIPT="$2"
FILES="$3"

case "$FILES" in
	"doubling")
		FILES="250M,500M,2-1G,2G,4G,8G,16G"
		;;
	"doubling4G")
		FILES="250M,500M,2-1G,2G,4G"
		;;
	"small")
		FILES="0-12K,1-128K,256K,512K,1M,10M,100M,250M,500M,750M,2-1G"
		;;
	"legacy")
		FILES="0-12K,1-128K,500M,2-1G,2G,4G,8G,16G"
		;;
esac

RUNS="$4"
OPPOSITE="$5"
BLOCKSIZE="$6"

if [ -z "$BLOCKSIZE" ]
then
	BLOCKSIZE="-"
fi

for b in $TESTTYPE
do
	for n in 0 1
	do
		for t in $SCRIPT
		do
			for f in $(eval echo "/tank/{$FILES}")
			do
				for r in $(seq $RUNS)
				do
					for bs in $BLOCKSIZE
					do
						FN="$b.$n.$t.$(basename "$f").$r"
						if [ ! -z "$OPPOSITE" ]
						then
							FN="$FN.O"
						fi
						if [ ! -z "$BLOCKSIZE" ] && [ ! "$BLOCKSIZE" = "-" ]
						then
							FN="$FN.$bs"
						fi
						touch "$FN"
					done
				done
			done
		done
	done
done
