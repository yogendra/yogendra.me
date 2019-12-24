#!/usr/bin/env bash

FILE=${1:-}
[[ -z $FILE ]] && echo "File name not given" && exit 1
[[ ! -f $FILE ]] && echo "$FILE: Not a reguler file" && exit 1

FILE_NAME=$(basename $FILE)
FILE_NAME_NO_EXT=${FILE_NAME%%.*}
FILE_DIR=$(cd `dirname $FILE`|pwd)
ASSET_DIR=$FILE_DIR/$FILE_NAME_NO_EXT
echo "$FILE_NAME: Creating Asset Dir ${ASSET_DIR}"
mkdir -p $ASSET_DIR

echo $FILE_NAME: Copy asset dir location
echo $ASSET_DIR | pbcopy

grep -Eo https\?://goo.gl/.\\S+  $FILE | sort | uniq | while read url
do
  echo "$FILE_NAME :: $url :: Launched browser"
  (cd $ASSET_DIR && open $url)
done
