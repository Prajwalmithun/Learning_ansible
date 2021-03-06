#!/bin/bash

## Author: Prajwal 
## Email: tkushal216@gmail.com
## Last revised: 2021/12/22
##
## Usage: ./publish_pub_key.sh FULL_PATH_OF_HOSTS_DETAIL_FILE
## 
## 
## Example of HOST file
<<comment
10.10.10.1,user1,pass1
10.10.10.2,user2,pass2
10.10.10.3,user3,pass3
comment


host_file=$1

for x in `cat $host_file`
do
	HOST=`echo $x | awk -F , '{print $1}'` 
	USER=`echo $x | awk -F , '{print $2}'`
	PASS=`echo $x | awk -F , '{print $3}'`
	#echo $HOSTIP; echo $USER; echo $PASS
	sshpass -p $PASS ssh-copy-id $USER@$HOSTIP
	echo -e "\n\n Copying public key to $HOST"
done

exit
