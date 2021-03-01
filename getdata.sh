#!/bin/bash
# getdata.sh <program> <data format> <which data> <fio type> <what data> <folder> <suffix>
BIN="$(dirname "$0")"

PROGRAM="$1"
FORMAT="$2"
WHICH="$3"
FIOTYPE="$4"
WHAT="$5"
FOLDER="$6"
SUFFIX="$7"

if [ "$WHICH" = "legacy" ]
then
	WHICH="{0-12K,1-128K,500M,2-1G,2G,4G,8G,16G}"
elif [ "$WHICH" = "doubling" ]
then
	WHICH="{250M,500M,2-1G,2G,4G,8G,16G}"
fi

if [ ! -z "${SUFFIX+x}" ]
then
	SUFFIX=".$SUFFIX"
fi

echo $@

if [ "$PROGRAM" = "fio" ]
then
	EXTRACTOR="extract${PROGRAM}${FORMAT}.py"
elif [ "$PROGRAM" = "simpleread" ]
then
	EXTRACTOR="extractrealtime.sh"
fi

"$BIN/$EXTRACTOR" "$WHAT" \
	$(eval echo ./${FOLDER}/${FIOTYPE}${PROGRAM}.${WHICH}${SUFFIX})
