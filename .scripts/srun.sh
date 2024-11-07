#!/usr/bin/bash
# srun
# script for challing other scripts in the .scripts folder
# by: dtpy

# TODO:
# [x] - add support for function as flies
# [x] - fix the position problem
# [x] - address the FIXME

SRC="$HOME/.scripts/"

cmd="$1"
fn=$2

print() {
  echo srun: "$1"
}

f_exists() {
  if [ ! -f $SRC$cmd ]; then
    print "script not found"
    return 1
  fi
  return 0
}

fn_exists() {
  [ $(type -t $1)"" == 'function' ]
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
    files=$(ls $SRC)
    files=${files//.sh/}
    echo "scripts: "
    for i in ${files//srun/}; do
      source $SRC$i.sh
      echo " $i"
      if ! fn_exists get_fn; then
        echo " ╘ the file do not provide a ls function"
        echo ""
        continue
      fi

      fns="$(get_fn)"
      fnl=$(($(echo "$fns" | wc -l) - 1))

      i=0
      for f in $fns; do
        if [ "$i" -eq "$fnl" ]; then
          echo " └ ""$f"
          continue
        fi
        echo " ├ ""$f"
        i=$(($i + 1))
      done

      # remove the get_fn function from a file to another
      unset get_fn
      echo ""
    done
    return
    ;;
  esac

  # correct file name
  if [[ "${cmd}" != *".sh" ]]; then
    cmd="$cmd.sh"
  fi

  if ! f_exists $SRC$cmd -eq 0; then return; fi

  source $SRC$cmd
  $fn ${@:2}

}

main $@
