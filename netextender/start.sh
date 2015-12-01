#!/bin/bash

if [ "$1" == "config" ]; then
	cat "$(realpath $0)"
	exit
fi

if [ "$1" == "negui" ]; then
	#exec /usr/bin/netExtenderClient
	exec /usr/bin/supervisord -c /etc/supervisord.conf
fi

SUDO="gksudo --"

if [ "$1" == "sudo" ]; then
	SUDO=sudo
	FLAGS=-t
fi

if [ "$(which gksudo)" == "" ]; then
	echo gksudo is required. Please install the gksu package before running.
	echo On Ubuntu, use:
	echo sudo apt-get install gksu
	exit 0
fi

xhost +local:
# Get user's timezone info, if supported by host
TZFILES=""
if [ -e /etc/timezone ]; then
	TZFILES+="-v /etc/timezone:/etc/timezone "
fi

if [ -e /etc/localtime ]; then
	TZFILES+="-v /etc/localtime:/etc/localtime "
fi


$SUDO \
	docker run $FLAGS -i --rm $TZFILES \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--privileged \
	-v ~/netextender:/root \
	-e DISPLAY=unix$DISPLAY \
	transistor1/remmina negui
	




