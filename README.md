# control-scripts
A small repo of important scripts I've written, primarily to operate on Raspbian (Debian).

PublicIP:
	Small command utilizing sed to yield public IP.

reboot_wifi.sh:
	Restart wlan0, sshd, minidlna (others?) if wlan0 iface is down.
	This is a problem because the ISP I currently have drops periodically.

service_start.sh:
	In-progress script to start several important programs on boot.

3DPC dir:
Print.py:
	Headless+client-less control of printer (uses nohup)

test
deluge-console "add -p /media/SEAGATE/MOVIES/FullMovies/ $URLPATH"
deluge-console "add -p /media/SEAGATE/MOVIES/Torrents/downloading/ $URLPATH"
deluge-console "add -p $FILEPATH $URLPATH"
