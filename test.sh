#!/bin/bash

echo "test"

echo "test params"

POSTFIX_NAME="_"$1

if [ $# != 0 ]; then
	echo 'postfix name given:' $POSTFIX_NAME
else
	echo 'no input'
fi

exit 0

