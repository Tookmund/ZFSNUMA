#!/bin/sh
# Assume we're in data/whatever

cp -r ../../newdata/* .
cp /var/log/autoarctest/* .
../../../logname.sh

for p in B U T M
do
	for n in 0 1
	do
		mv $p.$n.* $p$n

	done
done
