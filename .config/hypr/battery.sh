#!/bin/bash

root_bat="/sys/class/power_supply"
bat=$(ls $root_bat | grep BAT | wc -l)

if [[ $bat -eq 0 ]]; then exit; fi
for i in $(seq 0 $(($bat-1))); do
  echo -n "$(cat $root_bat/BAT$i/capacity)% "
done

