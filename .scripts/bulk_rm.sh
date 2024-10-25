#!/usr/bin/env bash
# bulk rm
# script for moving files under a certain dimension in bulk
# by: dtpy

SOURCE=$1
DEST=$2
[[ $3 = "" ]] && MAX_D=1024 || MAX_D=$3

print() {
  echo bulk_rm: $1
}

# error check
if [[ $SOURCE = "" ]] || [[ $DEST = "" ]]; then
  print "use: bulk_rm SOURCE DESTINATION size_threshold"
fi

# main loop
f=0
for file in $(ls -S -r $SOURCE); do
  file="$FOLDER/$file"
  dim=$(stat -c%s "$file")

  if (($dim > $MAX_DIM)); then
    exit
  fi
  echo $f
  mv $file "$DEST/"
  f=$(($f + 1))
done
