#!/bin/sh

# Passing the following parameters to mergetool:
#  local base remote merge_result

# params should come as: "$PWD/$LOCAL" "$PWD/$BASE" "$PWD/$REMOTE" "$PWD/$MERGED" 
#"C:/Program Files/SourceGear/Common/DiffMerge/sgdm.exe" "$1" "$2" "$3" --result="$4" --title1="Mine" --title2="Merging to: $4" --title3="Theirs"
#"C:/Program Files/SourceGear/Common/DiffMerge/sgdm.exe" "$1" "$2" "$3" --result="$4" --title1="Mine (LOCAL - Current branch verion (probably master?))" --title2="Merging to: $4" --title3="Theirs (REMOTE - Version to be merged (probably a topic branch?))"
diffmerge "$1" "$2" "$3" --result="$4" --title1="Mine (LOCAL - Current branch verion (probably master?))" --title2="Merging to: $4" --title3="Theirs (REMOTE - Version to be merged (probably a topic branch?))"
