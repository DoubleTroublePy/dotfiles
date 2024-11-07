#!/usr/bin/env bash
# foldes
# collection of script for managing folders
# by: dtpy

get_fn() {
  echo "split"
  echo "mkt"
  echo "flattens"
  echo "bulk_rm"
}

split() {
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
}

mkt() {
  print() {
    echo mkt: "$1"
  }

  # TODO: correct the folder generation makind that for every dept thah can be more than one folder
  # substantialy redo it
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
}

flattens() {
  print() {
    echo srun: "$1"
  }

  dep=$1

  if [[ "$dep" = "" ]]; then dep=2; fi
  find ./ -mindepth "$dep" -type f -exec mv -t ./ -i '{}' +
  $HOME/.scripts/cempty.sh .
  cempty() {
    find $1 -empty -type d -delete
  }
}

bulk_rm() {
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
}
