# file executing command on startup

# xrandr setting
# rotate the secondary screen on startup
xrandr --output HDMI-1 --rotate left
# set secondary screen to the left
xrandr --output DP-0 --auto --right-of HDMI-1 --primary

#xxx: for some reason we need to wait 2 seconds
sleep 2

# set the background
hsetroot -extend Pictures/vbk_fr.png

sleep 5

dhclient enp5s0
xset s offxset -dpms
