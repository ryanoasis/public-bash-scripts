# search for 'audience' AND 'segment'
# http://stackoverflow.com/questions/4795323/grep-for-multiple-strings-in-file-on-different-lines-ie-whole-file-not-line-b
grep -iIrnl audience * | xargs grep -iIrnl segment
