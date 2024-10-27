#!/usr/bin/bash
# srun
# script for challing other scripts in the .scripts folder
# by: dtpy

cmd="$1"

print() {
  for i in ${@:1}; do
    echo srun: "$i"
  done
}

main() {
  # error handling

  # fuck the loop
  if [[ "${cmd}" = srun* ]]; then
    print "NOPE :3"
    return
  fi

  if [[ "${cmd}" = "" ]]; then
    print "use this command for calling a script inside the scripts folder"
    return
  fi

  case $cmd in
  ls)
    files=$(ls .)
    files=${files//.sh/}
    echo "scripts: "
    for i in ${files//srun/}; do
      echo " - $i"
    done
    return
    ;;
  esac

  if [ ! -f $1 ]; then
    print "script not found"
    return
  fi

  # correct file name
  if [[ "${cmd}" != *".sh" ]]; then
    cmd="$cmd.sh"
  fi

  "$HOME/.scripts/$cmd" "${@:2}"
}

main
