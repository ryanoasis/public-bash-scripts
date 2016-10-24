#!/bin/bash
# http://stackoverflow.com/questions/26176481/generate-combinations-of-elements-with-echo

POWER=$((2**$#))
#BITS=`seq -f '0' -s '' 1 $#`
BITS=`eval echo {1..$#} | sed -E 's/[0-9]+[ ]*/0/g'`

while [ $POWER -gt 1 ];do
  POWER=$(($POWER-1))
  BIN=`bc <<< "obase=2; $POWER"`
  MASK=`echo $BITS | sed -e "s/0\{${#BIN}\}$/$BIN/" | grep -o .`
  POS=1; AWK=`for M in $MASK;do
    [ $M -eq 1 ] && echo -n "print \\$\${POS};"
    POS=$(($POS+1))
    done;echo`
  awk -v ORS=" " "{$AWK}" <<< "$@" | sed 's/ $//'
done
