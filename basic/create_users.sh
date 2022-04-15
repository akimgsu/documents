#!/bin/bash

# Script to create users
# Takes input file with user names on the command line as the first argument
# echo "marcia jan cindy" > users.txt
# ./create_users.sh users.txt
# echo $? => 20 grep 20 create_users.sh

# User name file
USERFILE=$1

if [ "$USERFILE" = "" ]
then
	echo "Please specify an input file!"
	exit 10
elif test -e $USERFILE
then
	for user in `cat $USERFILE`
	do
    	echo "Creating the "$user" user..."
		useradd -m $user ; echo "$user:linx" | chpasswd
	done
	exit 20
else
	echo "Invalid input file specified!"
	exit 30
fi
