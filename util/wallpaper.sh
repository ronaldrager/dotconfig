#!/bin/bash
WPPATH=$HOME/Pictures/wallpapers/

while true
do
	WP=`ls -1 $WPPATH | sort -R | tail -1`
	WP=$WPPATH$WP
	cp "$WP" /etc/lightdm/wallpaper/current

if [ "$DESKTOP_SESSION" == "gnome" -o "$DESKTOP_SESSION" == "cinnamon" ]; then
	#Set Wallpaper
	gsettings set org.gnome.desktop.background picture-uri "file://$WP"
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$WP"
fi

if [ "$DESKTOP_SESSION" == "xfce4" ]; then
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$WP"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/image-path -s "$WP"
fi

if [ "$DESKTOP_SESSION" == "i3" ]; then
	feh --bg-fill "/etc/lightdm/wallpaper/current"
fi

	WP=""
	#Sleep off that hard work
	sleep 1h
done
