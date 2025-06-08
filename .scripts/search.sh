search=$(wofi --show dmenu --prompt="" -H 1) 
if [ -z $search ]; then exit; fi
firefox --new-tab "duckduckgo.com/$search"
