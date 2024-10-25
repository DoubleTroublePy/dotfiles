#!/usr/bin/bash
# srun
# script for challing other scripts in the .scripts folder
# by: dtpy

cmd="$1"

print() {
  echo srun: "$1"
}

# error handling

# fuck the loop
if [[ "${cmd}" = srun* ]]; then
  print "NOPE :3"
  exit
fi

if [[ "${cmd}" = "" ]]; then
  print "use this command for calling a script inside the scripts folder"
  exit
elif [ ! -f $1 ]; then
  print "script not found"
  exit
fi

# correct file name
if [[ "${cmd}" != *".sh" ]]; then
  cmd="$cmd.sh"
fi

"$HOME/.scripts/$cmd" "${@:2}"
