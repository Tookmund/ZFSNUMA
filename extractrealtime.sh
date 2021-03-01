#!/bin/sh

# remove first argument
shift

for i in $@
do
	"$(dirname "$0")/extractrealtime.awk" $i
done
