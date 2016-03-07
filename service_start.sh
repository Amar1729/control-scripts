#!/bin/bash
# Script created by Amar Paul:	Oct 25, 2015
# 	I need certain services to run from startup
#	Those services are (as of 03/06/15):
#  deluged	deluged
#  deluge-web	deluge-web
#  noip2	sudo service noip2 start
#  btsync	sudo service btsync start
#  minidlna	sudo service minidlna start	be careful (check IP)
#		sudo service minidlna -R
#		sudo service minidlna force-reload
#  netatalk	sudo /etc/init.d/netatalk start		don't need
#  avahi-daemon	sudo /etc/init.d/avahi-daemon start	don't need

# apache stuff is kept in 	/var/www/html
#				and http.conf where?

message=" "
FILEPATH=/home/pi/.services.log

deluged > /dev/null
if [ $? != 0 ]
then
	message="Service script ran, deluged started"
else
	message="Service script ran, deluged failed"
fi
echo "$(date) --" $message >> $FILEPATH
# echo "deluged started: "
# ps aux | grep deluged

sudo /usr/local/bin/noip2 > /dev/null	# Should add to init.d
# echo "Noip started: "
# ps aux | grep noip2

sudo /etc/init.d/netatalk start > /dev/null
sudo /etc/init.d/avahi-daemon start > /dev/null

# Add minidlna, once working	(change port from 80)
# Add deluge-web, once working (change this one's port)
