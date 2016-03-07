#!/bin/bash
# disable dropbox start at boot (in dropbox gui)
# requires package: cpulimit (sudo apt-get install cpulimit)
# add this script to startup
# xfce session and startup original description:
# Name: Dropbox
# Description: Sync your files across computers and to the web
# Command: dropbox start -i

# no icon? or missing fix:
# http://askubuntu.com/questions/732967/dropbox-icon-is-not-working-xubuntu-14-04-lts-64

# just in case?
dropbox stop

DBUS_SESSION_BUS_ADDRESS="" && ionice -c 3 dropbox start -i && cpulimit -b -e dropbox -l 20
# this is working adhoc:
#dropbox stop && DBUS_SESSION_BUS_ADDRESS="" dropbox start

exit 0
# sources:
# http://askubuntu.com/questions/252484/how-do-i-limit-dropboxs-activity-on-the-hard-disk
