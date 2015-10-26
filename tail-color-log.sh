#!/bin/bash
# @author Ryan McIntyre

# log like: /c/wamp/www/proto/portal/log/frontend_local.log

ME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
MY_DIR=`dirname $0`

if [ -e $MY_DIR/unix-color-codes-not-escaped.sh ]; then
	. $MY_DIR/unix-color-codes-not-escaped.sh
fi

if [ $# == 0 ]; then
	echo -e "${On_Red}No log file given, usage: $ME <FILE_NAME>${Color_Off}"
	exit 1
else
	LOG_FILE=$1
	echo "Showing tail of: $LOG_FILE"
fi

tail -f $LOG_FILE | awk '
  /200 OK/ {print "\033[32m" $0 "\033[39m"; next}
  /View "Success"/ {print "\033[33m" $0 "\033[39m"; next}
  /sfPatternRouting/ {print "\033[35m" $0 "\033[39m"; next}
  /Doctrine_Connection/ {print "\033[36m" $0 "\033[39m"; next}
  /err/ {print "\033[31m" $0 "\033[39m"; next}
  /severe/ {print "\033[31m" $0 "\033[39m"; next}
  /debug/ {print "\033[34m" $0 "\033[39m"; next}
  1 {print}
'

# sources:

## http://stackoverflow.com/questions/192292/bash-how-best-to-include-other-scripts
