#!/bin/sh
# Find/list files not owned by user and group given
USER=ryan
GROUP=ryan

sudo find . ! -user $USER -o ! -group $GROUP | more
