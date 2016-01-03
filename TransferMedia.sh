#!/bin/bash

while [[ $# > 0 ]]
do
key="$1"

case $key in
	-d|--disk)
	DEVS="$2"
	shift
	;;
	-f|--files)
	FILES="$2"
	shift
	;;
	*)
	echo wut	#unknown option
	;;
esac
shift
done

sudo mount -o gid=pi,uid=pi $DEVS /media/USB_64
sudo cp -r "$FILES" /media/USB_64/Movies
