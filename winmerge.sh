#!/bin/sh
# http://stackoverflow.com/questions/1881594/use-winmerge-inside-of-git-to-file-diff
echo Launching WinMergeU.exe: $1 $2
#"$PROGRAMFILES/WinMerge/WinMergeU.exe" -e -ub -dl "Base" -dr "Mine" "$1" "$2"
"C:\Development/WinMerge/WinMergeU.exe" -e -ub -dl "Base" -dr "Mine" "$1" "$2"