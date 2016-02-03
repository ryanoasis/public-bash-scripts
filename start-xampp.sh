#!/bin/bash
# https://gist.github.com/gmmorris/796400
sudo pkill -9 apache
# might need this too...:
sudo service mysql stop
# now start it
sudo /opt/lampp/lampp start
