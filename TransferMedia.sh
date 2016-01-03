#!/bin/bash

#$DEVS = # arg1
#$FILES = # arg2

while [[ $# > 0 ]]
do
key="$1"

case $key in
	-a|--approved)
	TEST=false
	echo "Approved to rename ..."
	echo ""
	shift
	;;
	-p|--path)
	path="$2"
#		echo "this is"
#	ls "$path"
#		echo "how we do it with"
#		echo "$path"
#	path="../testnames/Season 1/"
#		echo "again now"
#		ls "$path"
#		echo "end test"
	filenum=1
	shift
	;;
#	-s|--sub)
#	sub=true
#	shift
#	;;
	*)
	echo wut	#unknown option
	;;
esac
shift
done



sudo mount $DEVS /media/USB_64
sudo cp -r $FILES /media/USB_64/Movies
