#!/bin/sh

while true; do
	if [ "$(systemctl --user is-failed pulseaudio.socket)" = "failed"  ]; then
		killall pa-applet
		systemctl --user stop pulseaudio.service pulseaudio.socket
		sleep 1
		systemctl --user restart pulseaudio.socket
	fi
	sleep 30
done
