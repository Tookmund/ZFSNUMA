#!/bin/bash
BIN="$(dirname "$0")"
for f in fio.{0-12K,1-128K,500M,2-1G,2G,4G,8G,16G}.$1
do
	echo $f
	"$BIN/extractfiojson.py" $f
done
printf "\n\n"
