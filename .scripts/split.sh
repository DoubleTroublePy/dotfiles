#!/usr/bin/bash
# split
# divide a folder in subfolder with a given max file number
# by: dtpy
i=0
for f in $(ls -tU .); do
  d=part_$(printf %03d $((i / 50000 + 1)))
  #if $((i % 2000 == 0)); then
  #  echo $i
  #fi
  #if $((i % 100 == 0)) && $((i % 2000 != 0)); then
  #  echo -n "."
  #fi

  mkdir -p $d >>/dev/null
  mv "$f" $d
  i=$((i + 1))
done
