#!/bin/bash

### get parameter from command line
if [ $1 ]; then
	server_type=$1
else
	echo " [Error] Could not find Server Name!"
	exit
fi

if [ $2 ]; then
	server_num=$2
else
	server_num='01'
fi

if [ $3 ]; then
	login_name=$3
else
	login_name=`whoami`
fi

### Server Address Config
#==================================================
AD01='10.85.197.235'
AS01='10.81.88.211'
ASR02='10.84.214.211'
ASA01='ayakashi-staging-admin-02.zc2.zynga.com'
APA01='ayakashi-admin-01.zc2.zynga.com'
APR01='10.80.138.235'
APR02='10.84.223.92'
#==================================================


#echo "[$server_type] [$server_num] [$login_name]"
server_ip=$server_type$server_num
eval host='$'$server_ip

if [ $4 ]; then
	comm_auth="scp ~/.ssh/id_rsa.pub ${login_name}@${host}:~/.ssh/authorized_keys2"
	echo $comm_auth
	eval $comm_auth
fi

comm_login="ssh ${login_name}@${host}"
echo $comm_login
eval $comm_login
