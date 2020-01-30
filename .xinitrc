#!/bin/bash

unclutter &
openbox &
xset s off
xset -dpms
sleep 5
url="https://openqa.opensuse.org?group=openSUSE Tumbleweed\$|openSUSE Leap [0-9]{2}.?[0-9]*\$|openSUSE Leap.\*JeOS\$|openSUSE Krypton|openQA|GNOME Next&limit_builds=2&time_limit_days=14&&show_tags=1&fullscreen=1&interval=60#build-results"
#url="https://openqa.suse.de/?group=SLES+12+%2F+%28Functional:+Server%29|SLE+15+%2F+%28Functional%7CYaST%29&default_expanded=1&limit_builds=3&time_limit_days=14&show_tags=1&fullscreen=1&interval=60"
chromium --kiosk "$url" &

while sleep 72000 ; do
	# reload every 20 hours
	xdotool windowactivate $(xdotool search --class Chromium)
	xdotool key F5
	xdotool windowactivate $(xdotool getactivewindow)
done
