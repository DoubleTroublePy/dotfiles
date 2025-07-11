#!/bin/bash

root_bat="/sys/class/power_supply"
bat=$(ls $root_bat | grep BAT | wc -l)
#hidpp_battery_0
#bat=$(( $bat | $(ls $root_bat | grep hidpp_battery | wc -l) ))
if [[ $bat -eq 0 ]] && [[ $1 = "--bat" ]]; then exit; fi
echo -n " | "
