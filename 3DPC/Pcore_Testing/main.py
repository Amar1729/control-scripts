#!/usr/bin/python

# This is the main script to run printers disconnected from client session

# Todo:
#	Modify to accept printer /dev path and gcode filepath as params


# This function is really just a wrapper for xyz.py

import os
os.system("nohup python xyz.py &")
