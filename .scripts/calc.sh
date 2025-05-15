#!/bin/bash

# bash calculator in reverse polish notation
# author: DTPY

function calc() {
  python -c "print($@)" 
}

cmd="${@: -1}"

if [[ $# -eq 0 ]]; then
  echo USE:
  echo numbers function
fi
if [[ $# -lt 2 ]]; then
  echo must use at least a number and a function 
fi

case $(echo "$cmd" | awk '{print toupper($0)}') in
  'SUM' | '+')
    sum=0
    for i in ${@:1:$#-1}; do
      sum=$(calc "$sum+$i")
    done
    echo $sum
  ;;
  
  #XXX: serius bug on subration instead of a-b-c=d is -a-b-c=d thus creating an
  #     error
  'SUB' | '-')
    for i in ${@:1:$#-1}; do
      sub=$(calc "$sub-$i")
    done
    echo $sub
  ;;

  'MLT' | '*')
    mlt=1
    for i in ${@:1:$#-1}; do
      mlt=$(calc "$mlt*$i")
    done
    echo $mlt
  ;;

  'DIV' | '/')
    if [[ $# -gt 3 ]]; then
      echo DIV support a max of 2 arguments
      exit
    fi
    #XXX: gives an error with floats
    if [ $1 -eq 0 ] || [ $2 -eq 0 ]; then
      echo arguments cannot be 0
      exit
    fi
    calc "$1/$2"
  ;;

  'POW')
    if [[ $# -gt 3 ]]; then
      echo POW support a max of 2 arguments
      exit
    fi
    calc "$1**$2"
  ;;

  'SQRT')
    if [[ $# -gt 2 ]]; then
      echo SQRT support a max of 1 arguments
      exit
    fi
    if [[ $1 -lt 0 ]]; then
      echo SQRT argument must be positive
      exit
    fi
    calc "$1**(1/2)"
  ;;
  *)
    echo you can use the following functions
    echo SUM SUB MLT DIV POW SQRT
  ;;
esac

