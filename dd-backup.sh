#!/bin/bash
# backup partitions using dd

echo "Back-up Files"

# variables
DATE=$(date +"%Y-%m-%d")
BACKUP_DIR_PARENT="/mnt/nas/msi-gp60-laptop"
DESTINATION_DIR=$BACKUP_DIR_PARENT/$DATE
# keep track of how long script takes to run
bench_start=$SECONDS
# store current path of script (help with relative paths)
MY_DIR=`dirname $0`

if [ -e $MY_DIR/unix-color-codes-not-escaped.sh ]; then
	echo -e "${On_Green}Unix color code file found, including.. ${Color_Off}"
	$MY_DIR/unix-color-codes-not-escaped.sh
else
	echo -e "${On_Red}Unix color code file not found${Color_Off}"
fi

# check if directory doesn't exist and not linked file
if [[ ! -d "${DESTINATION_DIR}" && ! -L "${DESTINATION_DIR}" ]] ; then
	echo -e "${On_Blue}Directory not found, probably first time running. creating: $DESTINATION_DIR${Color_Off}"
	# Control will enter here if $DIR doesn't exist.
	mkdir -p $DESTINATION_DIR
	# compare exit stats/code of last cmd
	if [ "$?" -ne "0" ]; then
		echo -e "${On_Red}Sorry, could not create the directory: ${DESTINATION_DIR} ${Color_Off}"
		exit 1
	fi
fi

# home backup
sudo dd if=/dev/sda7 | gzip -9  > $DESTINATION_DIR/sda7_home.img.gz
# filesystem root
sudo dd if=/dev/sda8 | gzip -9  > $DESTINATION_DIR/sda8_filesystem.img.gz

bench_end=$SECONDS

total_time=$(expr $bench_end - $bench_start)

echo "Backup finished successfully [total time in seconds: $total_time]"
#exit 0
