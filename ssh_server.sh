#!/bin/bash

### get parameter from command line
if [ $1 ]; then
	server_type=$1
else
	echo " [Error] Could not find Server Name!"
	exit
fi



### Server Address Config
#==================================================
j='ec2-user@13.230.100.243 -i jenkins.pem'
#==================================================



eval command='$'$1
comm_login="ssh $command"

echo $comm_login
eval $comm_login
