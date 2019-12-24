#!/usr/bin/env bash

FILE=${1:-}
[[ -z $FILE ]] && echo "File name not given" && exit 1

FILE_NAME=$(basename $FILE)
FILE_NAME_NO_EXT=${FILE_NAME%%.*}
FILE_DIR=$(dirname $FILE)
ASSET_DIR=$FILE_DIR/$FILE_NAME_NO_EXT

mkdir -p $ASSET_DIR

grep -Eo https\?://goo.gl/.\\S+  $FILE | sort | uniq | while read url
do
  (cd $ASSET_DIR && open $url)
done
