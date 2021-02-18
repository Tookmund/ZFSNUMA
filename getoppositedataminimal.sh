#!/bin/bash
BIN="$(dirname "$0")"
EXT=""
if [ ! -z "${2+x}" ]
then
	EXT=".$2"
fi
for f in ./$3/fio.{0-12K,1-128K,500M,2-1G,2G,4G,8G,16G}$EXT
do
	echo $f
	"$BIN/extractfiominimal.py" "$1" "$f"
	printf "\n"
done
printf "\n\n"