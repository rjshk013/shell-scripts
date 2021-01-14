#!/bin/bash
used=$(df -Ph | grep '/dev/sda1' | awk {'print $5'})
max=30%
if [ ${used%?} -ge ${max%?} ]; then
echo "The Mount Point "/" on $(hostname) has used $used at $(date)" | mail -s "Disk space alert on $(hostname): $used used" rjshk013@gmail.com
fi
