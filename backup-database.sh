#!/bin/sh
# @author Ryan McIntyre

# @todo
# option for all database
# e.g.
# mysqldump -u root --all-databases | gzip -9 > /c/Users/Ryan/db_backups/ALL_DBS_$(date +%d-%m[%b]-%Y-%H_%M_%S).sql.gz

MYSQL_DUMP="/opt/lampp/bin/mysqldump"

echo "Enter Database name: "
read DBNAME
echo "Database: $DBNAME will be backed up"

echo "Enter backup tag description (<ENTER> for default): "
read POSTFIX_NAME

if [ $POSTFIX_NAME != "" ]; then
	echo 'Backup tag description given: ' $POSTFIX_NAME
	POSTFIX_NAME="_"$POSTFIX_NAME
else
	# no arguments
	echo 'No backup tag description given'
	POSTFIX_NAME=""
fi

SAVE_PATH="/home/ryan/db_backups/${DBNAME}_$(date +%d-%m[%b]-%Y-%H_%M_%S)$POSTFIX_NAME.sql.gz"

echo -n "Backing up to: $SAVE_PATH"

# To run a process in the background, include an  &  (an ampersand) at the end of the command you use to run the job
$MYSQL_DUMP -u root $DBNAME | gzip -9 > $SAVE_PATH &
# $! = last pid
mysqlpid=$!

#while ps | grep " $mysqlpid " > /dev/null
while kill -0 $mysqlpid > /dev/null # only check process is alive, doesn't kill
do
	echo -n ". "
	sleep 2
done

echo -n "Complete"
echo -n "File saved to: " $SAVE_PATH

exit 0


# sources:
# http://stackoverflow.com/questions/1570262/shell-get-exit-code-of-background-process
# http://stackoverflow.com/questions/226703/how-do-i-prompt-for-input-in-a-linux-shell-script
