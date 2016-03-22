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
	-a|--approved)
	APPR=True
	shift
	;;
	*)
	echo wut	#unknown option
	;;
esac
shift
done

# Only run following command if $DEVS is defined
if [ "$DEVS" ]; then
	sudo mount -o gid=pi,uid=pi $DEVS /media/USB_64
fi

# sudo cp -r "$FILES" /media/USB_64/Movies
if [ -z $APPR ]; then
	rsync "$FILES" /media/USB_64/Movies/ -ahmrvzn --include-from="/home/pi/control-scripts/MovieTypes" -f 'hide,! */'
else
	nohup rsync "$FILES" /media/USB_64/Movies/ -ahmrvz --include-from="/home/pi/control-scripts/MovieTypes" -f 'hide,! */' &

fi
