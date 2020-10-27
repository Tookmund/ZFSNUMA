#!/bin/sh
for i in $@
do
	head -c "$(basename "$i")" /dev/urandom > "$i"
done
