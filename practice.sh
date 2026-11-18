#!/bin/bash
#read -p"please enter the user name " user
#read -p"please enter the gruop name " group
#
#if [ "$user" = "mamazi" ] && [ "$group" = "mamazii" ]
#then
#	echo "welcome $group"
#else
#	echo " at least on of them is incorrect"
#fi
#echo "$# is num of params"
#echo "$* are params"


for p in $( cat /etc/apt/sources.list.d/docker.list )
do echo "$p"
done
