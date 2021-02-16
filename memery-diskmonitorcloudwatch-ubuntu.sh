#!/bin/bash]
sudo apt-get update
sudo apt-get install unzip
sudo apt-get install libwww-perl libdatetime-perl
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
unzip CloudWatchMonitoringScripts-1.2.2.zip
rm CloudWatchMonitoringScripts-1.2.2.zip
cd aws-scripts-mon
sudo mv awscreds.template awscreds.conf
sed 's/AWSAccessKeyId=/AWSAccessKeyId=secrteid/' awscreds.conf
sed 's/AWSSecretKey=/AWSSecretKey=secrtekey/' awscreds.conf
./mon-put-instance-data.pl --mem-util --verify --verbose
./mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/
#add the script to crontab
*/5 * * * * ~/aws-scripts-mon/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --from-cron
