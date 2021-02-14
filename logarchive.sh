#!/bin/bash

#Define the Log files location
LOGS_FOLDER=/var/log/jenkins

#Define the Archived log files location
ARCHIVE_FOLDER=~/scripts/archive

#Only archive the files older than X Days, the format is +n
X=+5

#Create a temp folder for processing log files
mkdir -p $ARCHIVE_FOLDER/temp

#Move the logs that older than X days to a temp folder
mv -f $(find $LOGS_FOLDER -type f -mtime $X) $ARCHIVE_FOLDER/temp

#Process the archived logs to categarize them based on the Year/Month/Day
for log in $ARCHIVE_FOLDER/temp/*
do
    date=`echo $log | grep -oE ’20[0-9][0-9][0-9][0-9][0-9][0-9]’`
    year=${date:0:4}
    month=${date:4:2}
    day=${date:6:2}
   
    mkdir -p $ARCHIVE_FOLDER/$year
    mkdir -p $ARCHIVE_FOLDER/$year/$month
    mkdir -p $ARCHIVE_FOLDER/$year/$month/$day
    cp -rf $log $ARCHIVE_FOLDER/$year/$month/$day
 
done

#Remove the temp folder
rm -rf $ARCHIVE_FOLDER/temp
