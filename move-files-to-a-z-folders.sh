#!/bin/bash

# move files beginning w/ A..Z to A..Z folders

# wont work for filetypes (does all):
#for f in *
# do dangerous and complicated:
#for f in 'ls'
for f in *; do
	if [ -f "$f" ]
	then 
		#echo "$f file";
		FIRST_CHAR=${f:0:1};
		#echo "first char = $FIRST_CHAR";
		#FIRST_CHAR_UPPER=$FIRST_CHAR | tr [:lower:] [:upper:];
		FIRST_CHAR_UPPER=$(echo "$FIRST_CHAR" | tr [:lower:] [:upper:]);
		#echo "mv \"$f\" \"$FIRST_CHAR_UPPER/$f\"";
		mv "$f" "$FIRST_CHAR_UPPER/$f";
	else
		echo "skipping $f not a file";
	fi
done