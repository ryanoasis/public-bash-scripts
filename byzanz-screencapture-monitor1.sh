#!/bin/bash
# @author Ryan McIntyre
# references:
# http://stackoverflow.com/questions/2642585/read-a-variable-in-bash-with-a-default-value

# default to 10
read -p "Duration of seconds to run (enter for default of 10): " DURATION
DURATION=${DURATION:-10}
echo $DURATION

# default to 0
read -p "X position (enter for default of 0): " XPOS
XPOS=${XPOS:-0}
echo $XPOS

# default to 0
read -p "Y position (enter for default of 0): " YPOS
YPOS=${YPOS:-0}
echo $YPOS

# default to 1920
read -p "Width (enter for default of 1920): " WIDTH
WIDTH=${WIDTH:-1920}
echo $WIDTH

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

byzanz-record --duration=$DURATION --x=$XPOS --y=$YPOS --width=$WIDTH --delay=$DELAY "$OUTDIR/screencast_$DATE.gif"

thunar $OUTDIR
