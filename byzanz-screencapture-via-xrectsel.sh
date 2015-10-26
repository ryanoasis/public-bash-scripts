#!/bin/bash
# @author Ryan McIntyre
# references:
# http://stackoverflow.com/questions/2642585/read-a-variable-in-bash-with-a-default-value
# http://choorucode.com/2014/01/24/how-to-screen-capture-a-region-to-gif-using-byzanz/

# default to 10
read -p "Duration of seconds to run (enter for default of 10): " DURATION
DURATION=${DURATION:-10}
echo $DURATION

# default to 1
read -p "Delay (enter for default of 1): " DELAY
DELAY=${DELAY:-1}
echo $DELAY

OUTDIR=~/Screencasts/byzanz
# e.g. 29-Apr-2014-07:31:31 PM
DATE=$(date +"%d-%b-%Y-%r")

# check if directory doesn't exist and not linked file                          
if [[ ! -d "${DESTINATION_DIR}" && ! -L "${DESTINATION_DIR}" ]] ; then
	mkdir -p $OUTDIR
fi

# xrectsel from https://github.com/lolilolicon/xrectsel
ARGUMENTS=$(xrectsel "--x=%x --y=%y --width=%w --height=%h") || exit -1

byzanz-record --verbose --delay=$DELAY ${ARGUMENTS} --duration=$DURATION  "$OUTDIR/screencast_$DATE.gif"

thunar $OUTDIR




