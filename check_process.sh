#!/bin/bash
#Check Listening Ports with netstat
sudo netstat -tunlp
#To check with particular port no 
sudo netstat -tnlp | grep :22
#Check Listening Ports with ss
sudo ss -tunlp
#To get a list of all listening TCP ports with lsof
sudo lsof -nP -iTCP -sTCP:LISTEN
#To find what process is listening on a particular port, for example, port 3306 you would use:
sudo lsof -nP -iTCP:3306 -sTCP:LISTEN
