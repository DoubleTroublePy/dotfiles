#!/usr/bin/bash

print() {
  echo srun: "$1"
}

dep=$1

if [[ "$dep" = "" ]]; then dep=2; fi
find ./ -mindepth "$dep" -type f -exec mv -t ./ -i '{}' +
$HOME/.scripts/cempty.sh .
