# Rudimentary check for common services
deluged
deluge-web &
sudo service noip2 start
sudo service btsync start
sudo service minidlna start	# be careful (check IP)
#sudo service minidlna -R
#sudo service minidlna force-reload
# lol, stop these services:
#  netatalk	sudo /etc/init.d/netatalk start		don't need
#  avahi-daemon	sudo /etc/init.d/avahi-daemon start	don't need

# This shouldn't be running yet; look into websites for sivandamar and BTC
# apache stuff is kept in 	/var/www/html
