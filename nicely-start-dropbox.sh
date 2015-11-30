#!/bin/bash
# disable dropbox start at boot (in dropbox gui)
# requires package: cpulimit (sudo apt-get install cpulimit)
# add this script to startup
# xfce session and startup original description:
# Name: Dropbox
# Description: Sync your files across computers and to the web
# Command: dropbox start -i

ionice -c 3 dropbox start -i && cpulimit -b -e dropbox -l 20

exit 0
# sources:
# http://askubuntu.com/questions/252484/how-do-i-limit-dropboxs-activity-on-the-hard-disk
