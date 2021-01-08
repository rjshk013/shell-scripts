#!/bin/bash
USAGE="$(df / | grep / | awk '{ print $5}' )"
echo web server $USAGE of disk used 

