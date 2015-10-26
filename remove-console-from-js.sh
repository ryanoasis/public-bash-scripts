#!/bin/sh

# http://stackoverflow.com/questions/6595429/using-sed-to-remove-all-console-log-from-javascript-file
# http://tille.garrels.be/training/bash/ch07s02.html (bash help)

# sed usage example:
# sed -e 's/SEARCH_STRING/REPLACE_STRING/g' file > file.out
# have to escape all / (forward slashes) because has special meaning in sed
SEARCH_STRING="(\/\/)*console.(log|debug|info|warn|error|assert|dir|dirxml|trace|group|groupEnd|time|timeEnd|profile|profileEnd|count)\((.*)\);?"
REPLACE_STRING=""

if [ ! $# == 1 ]; then
	echo "Must provide 1 argument (the file to modify)"
elif [ ! -f $1 ]; then
	echo "This thing you passed is not a file or cannot be found!"
else
	echo "Modifying file!"
	#sed -E "s/$SEARCH_STRING/$REPLACE_STRING/g" $1 > "$1.tmp"
	sed -E "/$SEARCH_STRING/ d" $1 > "$1.tmp"
	cp "$1.tmp" $1
	rm "$1.tmp"
fi

echo "Complete"