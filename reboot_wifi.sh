#!/bin/bash

LOGFILE=/home/pi/control-scripts/syslog.log

if [ "$(who)" == "" ]
then
#---------------------------------------------------------------

# Case where there are no users online (if $who is empty

TESTIP=74.125.224.72
ping -c4 ${TESTIP} > /dev/null

if [ $? != 0 ]
then

	message="$(date) -- REBOOT: Restarting wifi, sshd, dlna"
	# echo >$LOGFILE  empties the file so just the last log is saved
	echo $message >>$LOGFILE

	ifdown --force wlan0
	ifup wlan0

	# portability?
	ifdown --force etho0
	ifup eth0

#	sudo /etc/init.d/sshd restart
	sudo service ssh restart
	sudo service minidlna restart
#	sudo pkill deluged
	deluged

#	bash ~/Scripts/bash/reboot_wifi.sh

	# Implement reboot here if Wifi doesn't work after 10 runs
else
	message="$(date) -- REBOOT: WiFi seems up"
	# echo >$LOGFILE  empties the file so just the last log is saved
	echo $message >>$LOGFILE
fi
#---------------------------------------------------------------
else	# Users is not empty (I'm logged on) so dont do anything
	message="$(date) -- REBOOT: Users logged on, exiting."
	echo $message >> $LOGFILE
fi
