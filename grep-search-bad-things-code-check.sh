#!/bin/sh

# first attempt

# grep -rin -e 'console\.log\|debugger' ./web/js/ # to dependent on file structure

# second attempt

# http://www.daniweb.com/community-center/it-professionals-lounge/threads/85626

# Which translates in english to.. search (find) in this folder (.) for files matching the filter ( -name ) *.php [ recursiveness should be default ]; when each file is found, execute grep, look for 'some_string', and pass in the found filename ( where the {} placeholder is ). Because that effectively executes grep once per file ( rather than once for many files ), you need the -H option to force grep to turn on the output of the filename; it wouldn't bother otherwise for a single file grep.

find . -name "*.js" -exec grep -rinH -e 'console\.log\|debugger' {} \;