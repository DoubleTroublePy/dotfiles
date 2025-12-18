#!/bin/bash

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# Written during a probable semi maniac episode, the code is probably shit.   #
# you are free to use it, but i assure nothing about is innerdoings. IDK why  #
# do you would want to use it but go ahead (why english spelling was created  #
# by a drunk monkey). So in any case, this code is used for fixing posters    #
# (for now) in VotV, because the game assume a square immage and streaches    #
# (im writing by feeling as of now so, pass me the aweful spelling) it, and   #
# to avoid that you need a transparend padding, if you are using something    #
# else like paintings, you have to change the aspect ratio <<TODO. Also VotV  # 
# as of now recognises only pngs so all other formats will be converted to    # 
# png by imagemagik. I like to preserve the original file so this. And this   #
# software sould fail in a clean way. Like it was newer run. It thing is      #
# everything, so... by. I WILL GO TO SLEEP NOW. BUT NO BEFORE MAKING THIS     #
# BEAUTIFULL BOUNDING BOX. ok by for real                                     #
# i forgot to mark the version lulz                                           #
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# Author: DTPY                                                                #
# filename: VotV_tool_correct.sh //TODO: for the love of god future me, find  #
#                                        a better name for this damns file    #
# version: 1.0.0                                                              #
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

file=$1
file_name="${file%.*}"
tmp_file=".tmp_$file_name.png"

# remove a file only if exist
function srm {
  if [ ! -e "$1" ]; then return; fi
  rm "$1"
}

# if the file is not png convert it to temporary png
if [[ $1 != *.png ]]; then
  echo "file is not a png."
  echo "converting ..."
  ERROR=$(magick "$file" "$tmp_file" 2>&1 >/dev/null)
  #magick "$file" "$tmp_file"
fi

# if for whatever the conversion fails alt the program without doing anything
if [ $? -ne 0 ]; then
  echo "!!! conversion failed !!!"
  echo -e "└───"
  echo -e "$ERROR"
  echo -e "┌───"
  echo -e "\e[4;37mthis is not our responsibility, this are outsourced mages\e[0m"
  echo "+++ goodbye +++"
  exit 1
fi

#TODO: give an option to not preserve the original file
# preserve the original file
mv "$file" ".$file.bkp"

# pad the png with a transparent box
echo "doing the magic ..."
magick "$tmp_file" \
  -background none \
  -gravity center \
  -resize 5000x5000 \
  -extent 5000x5000 \
  "$file_name.png"

if [ $? -ne 0 ]; then
  echo "!!! magic failed !!!"
  
  # clean after the fail
  echo "the mage is cleaning the mess ..."
  mv ".$file.bkp" "$file"
  srm "$tmp_file"
  srm "$file_name.png"
  echo "we are sorry our mage couldn't do the trick :("
  echo "+++ better luck next time +++"
  exit 1
fi

srm "$tmp_file"
echo "+++ magic done +++"
echo -e "\e[4;37mps: the old file still exist under the name .$file.bkp\e[0m"

