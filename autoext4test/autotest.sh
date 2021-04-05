#!/bin/sh

if [ -z $1 ]
then
	echo "Requires a Test File!"
	exit 1
fi

NAME="$(basename "$1")"
BS="$2"
RUN="$3"

OUT="${BS}fio.${NAME}.${RUN}"

if [ -f $OUT ]
then
	echo "$OUT exists??"
	exit 1
fi

fio \
	--readonly \
	--pre_read=1 \
	--ioengine=psync \
	--rw=read \
	--name "$NAME" \
	--bs "$BS" \
	--filename "$1" \
	--output-format=json \
	--output "$OUT"
