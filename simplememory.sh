#!/bin/bash

if [ -z $1 ]
then
	echo "Requires a Test Amount!"
	exit 1
fi


DIR="$(dirname "$0")"
EXE="simplememory"

NAME="$(basename "$1")"
BLOCKSIZE="${NAME/M/000000}"
BLOCKSIZE="${BLOCKSIZE/G/000000000}"

OUT="$EXE.$NAME.$2"
if [ -f "$OUT" ]
then
	echo "$OUT already exists!"
	exit 1
fi
{
	time "$DIR/simplememory/$EXE" "$BLOCKSIZE"
} > "$OUT" 2>&1
