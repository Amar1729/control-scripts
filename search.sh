#!/bin/bash

#sudo find /etc -name "minidlna"
# 1590  find ~/ -name "minidlna"
# 1591  sudo find / -name "minidlna"
sudo find /etc -name "minidlna"
sudo find /bin -name "minidlna"
sudo find /dev -name "minidlna"
sudo find /home -name "minidlna"
sudo find /sys -name "minidlna"
sudo find /lib -name "minidlna"
sudo find /opt -name "minidlna"
sudo find /root -name "minidlna"
sudo find /sbin -name "minidlna"
sudo find /run -name "minidlna"
sudo find /usr -name "minidlna"
sudo find /var -name "minidlna"

#For displaying public IP
#curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//
