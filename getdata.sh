#!/bin/sh
for f in */*.post*
do
	echo $f
	../../../extractdata.awk "$f"
done
