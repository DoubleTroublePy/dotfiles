#!/usr/bin/bash
# glow + watch with colors
alias wglow="watch -c -t glow --style dark $1"

# sceenshot whit date as name
alias auimport="import /home/dtpy/Pictures/screenshots/$(date +%Y_%m_%d_%H%M%S).png"

lpa() {
  lp <(iconv -f UTF-8 -t ASCII//TRANSLIT $1)
}

to_ascii() {
  iconv -f UTF-8 -t ASCII//TRANSLIT $1
}
