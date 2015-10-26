#!/bin/bash
# thank you: http://www.linuxquestions.org/questions/debian-26/shmconfig-in-debian-645503/#post3838794
# script to turn off touchpad if mouse present at login
# synclient is the synaptic utility to manage the touchpad
# grep the "lsusb" output and do a wordcount on number of lines with "Logitech" which should = 1 if a Logitech mouse is present
#
# Obviously the "Logitech" should be replaced with your brand of mouse, and perhaps be more exact in case you have other USB devices that have similar names

# I found on: http://crunchbang.org/forums/viewtopic.php?id=15992

/usr/bin/synclient touchpadoff=`lsusb | grep Logitech | wc -l`
