#!/bin/bash

echo "Reading config...." >&2
source config.cfg
echo "Config for the username: $cool_username" >&2
echo "Config for the target host: $cool_host" >&2

# sources
# http://wiki.bash-hackers.org/howto/conffile
