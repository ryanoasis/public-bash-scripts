#!/bin/sh

# http://stackoverflow.com/questions/6595429/using-sed-to-remove-all-console-log-from-javascript-file
# http://tille.garrels.be/training/bash/ch07s02.html (bash help)

# sed usage example:
# sed -e 's/SEARCH_STRING/REPLACE_STRING/g' file > file.out
# have to escape all / (forward slashes) because has special meaning in sed
SEARCH_STRING="(\/\/)*console.(log|debug|info|warn)\((.*)\);?"
REPLACE_STRING="void 0"

function removeLogFromFile {
  echo "Modifying file $1!"
	sed -E "s/$SEARCH_STRING/$REPLACE_STRING/g" $1 > "$1.tmp"
	# sed -E "s/$SEARCH_STRING/ d" $1 > "$1.tmp"
	cp "$1.tmp" $1
	rm "$1.tmp"
}

if [ ! $# == 1 ]; then
  echo "You Must provide 1 argument (the file to modify)"
  exit 1
elif [ ! -f $1 ] && [ ! -d $1 ]; then
  echo "This thing you passed is not a file or directory"
  exit 1
elif [ -f $1 ]; then
  echo "You passed a file!"
  removeLogFromFile $1
elif [ -d $1 ]; then
  echo "You passed a directory $1!"
  for i in $(find $1 -name "*.js")
  do
    removeLogFromFile $i
  done
else echo "Not sure what to do with $i";
fi
echo "Complete"
