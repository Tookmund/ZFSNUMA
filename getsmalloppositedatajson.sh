#!/bin/bash
BIN="$(dirname "$0")"
EXT=""
if [ ! -z "${2+x}" ]
then
	EXT=".$2"
fi
for f in ./$3/fio.{0-12K,1-128K,256K,512K,1M,250M,500M,750M,2-1G}$EXT
do
	echo $f
	"$BIN/extractfiojson.py" "$1" "$f"
	printf "\n"
done
