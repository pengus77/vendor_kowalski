#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  if [ -f $file_path ]; then
    file_size=$(stat -c%s $file_path)
    id=$(cat "$file_path.md5" | cut -d' ' -f1)
    datetime=$(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2);
    echo "{\n   \"filename\": \"$file_name\",\n   \"datetime\": $datetime,\n   \"size\": $file_size,\n   \"id\": \"$id\"\n}" > $file_path.json
  fi
fi
