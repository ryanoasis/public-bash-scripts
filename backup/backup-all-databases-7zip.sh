#!/bin/sh

SQL_DUMP_SAVE_PATH="/cygdrive/c/Users/Ryan/db_backups/ALL_DBS_$(date +%d-%m[%b]-%Y-%H_%M_%S)$POSTFIX_NAME.sql"
ZIP_DUMP_SAVE_PATH="$BASE_SAVE_PATH.7z"

mysqldump -u root --all-databases > $SQL_DUMP_SAVE_PATH

7z a -t7z -mx9 $ZIP_DUMP_SAVE_PATH $SQL_DUMP_SAVE_PATH

#rm $SQL_DUMP_SAVE_PATH

exit 0

# sources:
# http://www.dotnetperls.com/7-zip-examples
# http://stackoverflow.com/questions/11214437/php-mysqldump-and-zip-7z
## 7zip doesnt take from stdin ?
# http://stackoverflow.com/questions/1287383/not-able-to-use-7-zip-to-compress-stdin-and-output-with-stdout
## Note: The current version of 7-Zip does not support reading of archives from stdin.
