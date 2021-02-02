#!/bin/bash
CHECK=$0
SERVICE=$1
DATE=`date`
OUTPUT=$(ps aux | grep -v grep | grep -v $CHECK |grep $1)
echo $OUTPUT
if [ "${#OUTPUT}" -gt 0 ] ;
then echo "$DATE: $SERVICE service running, everything is fine"
else echo "$DATE: $SERVICE is not running"
fi

#Run the script wuth process name eg: scriptname nginx
