#!/bin/bash

FILE=/home/pi/Scripts/bash/syslog.log

message="$(date) -- CHECK:  Up with users\n\t$(who)"
echo -e $message >> $FILE
