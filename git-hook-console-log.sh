#!/bin/sh

# git diff --cached = stagged changes
# git diff = all changes

has_console_log=$(git diff --cached | grep -F 'console.log')

if [ "$has_console_log" != "" ]
then
  echo "ERROR: You have console.log in your changes. Consider removing them."
  exit 1
fi

has_console_log=$(git diff | grep -F 'console.log')

if [ "$has_console_log" != "" ]
then
  echo "ERROR: You have console.log in your changes. Consider removing them."
  exit 1
fi