#!/bin/bash
ln=0
time=$1 || 93

echo -n '  '
for i in $(seq 0 $(($time-1))); do
  echo -n "$i"
  if  [ $(($i > 9 )) -eq 1 ]; then ln=$(($ln+1)); fi
  ln=$(($ln+2))
  if [[ $i > 1 && $(( ($ln+1)%36==0 )) -eq 1 ]]; then 
    echo ''
    echo -n '  '
  else
    echo -n '.'
  fi
  sleep 1m
done
echo $(($i+1))

for i in {0..3}; do
  res=0
  pw-play ~/Music/f18locked_launched.mp3 && res=1
  if [[ $res -eq 0 ]]; then exit; fi
done
