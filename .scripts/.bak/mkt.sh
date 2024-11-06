#!/usr/bin/bash
# mkt
# make a file tree for testing pourgoses
# author: dtpy

print() {
  echo mkt: "$1"
}

# TODO: correct the folder generation makind that for every dept thah can be more than one folder
dep() {
  dep=$1
  fnum=$2
  if [[ $dep -eq 0 ]] || [[ $fnum -eq 0 ]] && [[ $3 != "s" ]]; then
    print "[max tree dept] [max file count]"
    exit
  fi

  rnd=$((1 + $RANDOM % 10))
  if [[ $1 -ne 0 ]]; then
    rnd=0
  fi
  if [[ $rnd -gt 5 ]]; then exit; fi
  echo creating folder folder_$dep
  mkdir folder_$dep
  for i in $(seq 1 $fnum); do
    rnd=$((1 + $RANDOM % 10))
    if [[ $rnd -gt 5 ]]; then break; fi
    echo "  creating file file_$RANDOM"
    touch file_$RANDOM
  done
  cd folder_$dep
  dep $((dep - 1)) $fnum "s"
}

mkdir t_root
cd t_root
dep $@
