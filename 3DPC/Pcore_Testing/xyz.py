#!/usr/bin/python

# This script written Oct 18, 2015 by Amar Paul
# Keep in mind this was written for a version of Printcore that
# seems to have been installed ~Fall 2013 and was never updated

# Hence this script may have to be rewritten, in part, for updates.
# Especially keep an eye on
#	from printcore import printcore
# which may need to be changed to
#	from printrun.printcore import printcore

# ??? I don't have anything else for you except to say Good Luck

import sys, os
sys.path.append(os.path.abspath("/home/pi/Printrun"))
from printcore import printcore
from printrun import gcoder

print "Enter printer path: "
printer_path = raw_input()
print "Enter file path:		//try /home/pi/Pcore_Testing/calib.gcode"
file_path = raw_input()

if len(printer_path) < 4: printer_path="/dev/ttyACM0"
if len(file_path) < 4:	file_path="/home/pi/Pcore_Testing/calib.gcode"

# Need to accept path as parameter lol if multiple printers are up
p = printcore(printer_path, 115200)
# p = printcore('/dev/ttyACM0',115200)
# p = printcore('/dev/ttyACM1',115200)
p.send_now("G28")	# Home all axes
p.send_now("M104 S200")	# Extruder temp, don't wait

# This line should be rewritten to accept file path as param
#gcode = [i.strip() for i in open('/home/pi/Pcore_Testing/calib.gcode')]
gcode = [i.strip() for i in open(file_path)]

# Following line is using (deprecated?) Gcode, as opposed to current LightGCode

# This line is relevant to updated version of Printrun.
gcode = gcoder.LightGCode(gcode)
#gcode = gcoder.GCode(gcode)
p.startprint(gcode)

p.send_now("G28")	# Home axes (probably already in file)
p.send_now("M103")	# All extruders off
p.disconnect
os.system('message="$(date) -- File finished printing" && FILEPATH=/home/pi/Pcore_Testing/Log_printing.log && echo $message >> $FILEPATH')
os.system('echo "" >> Log_printing.log')
