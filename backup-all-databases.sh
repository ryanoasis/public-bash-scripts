#!/bin/sh

if [ $# != 0 ]; then
	echo 'Info: Postfix name given: ' $1
	POSTFIX_NAME="_"$1
else
	# no arguments
	echo 'Info: No postfix name given'
	POSTFIX_NAME=""
fi

echo -n "Backing up "

exit 1

SAVE_PATH="/cygdrive/c/Users/Ryan/db_backups/ALL_DBS_$(date +%d-%m[%b]-%Y-%H_%M_%S)$POSTFIX_NAME.sql.gz"

mysqldump -u root --all-databases | gzip -9 > $SAVE_PATH

exit 0
