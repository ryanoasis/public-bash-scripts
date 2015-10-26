#!/bin/sh

# diff is called by git with 7 parameters:
#  path old-file old-hex old-mode new-file new-hex new-mode
"C:/Program Files/SourceGear/Common/DiffMerge/sgdm.exe" "$2" "$5" | cat

#"C:/Program Files/WinMerge/WinMergeU.exe" "$2" "$5" | cat
#"C:/Program Files/KDiff3/kdiff3.exe" "$2" "$5" | cat