#!/bin/bash
#To view the current swap setting
sysctl -a | grep swap
#give swappiness 1 to kernel
sysctl -w vm.swappiness=1
# Make persistent across reboots by appending this line to the /etc/sysctl.conf file
echo “vm.swappiness=1” >> /etc/sysctl.conf
