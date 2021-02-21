#!/bin/bash
# getdata.sh <data format> <which data> <fio type> <what data> <folder> <suffix>
BIN="$(dirname "$0")"

FORMAT="$1"
WHICH="$2"
FIOTYPE="$3"
WHAT="$4"
FOLDER="$5"
SUFFIX="$6"

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

for f in $(eval echo ./${FOLDER}/${FIOTYPE}fio.${WHICH}${SUFFIX})
do
	echo $f
	"$BIN/extractfio${FORMAT}.py" "$WHAT" "$f"
	printf "\n"
done
