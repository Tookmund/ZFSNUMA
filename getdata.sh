#!/bin/bash
BIN="$(dirname "$0")"
for s in $BIN/extract{bandwidth,50latency}.awk
do
    for f in fio.{0-12K,1-128K,500M,2-1G,2G,4G,8G,16G}.$1
    do

        echo $f
        $s $f
    done
    printf "\n\n"
done
