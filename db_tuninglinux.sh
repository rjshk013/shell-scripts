#!/bin/bash
#To view the current swap setting
sysctl -a | grep swap
#give swappiness 1 to kernel
sysctl -w vm.swappiness=1
# Make persistent across reboots by appending this line to the /etc/sysctl.conf file
echo “vm.swappiness=1” >> /etc/sysctl.conf
# Set the swappiness value as root
echo 1 > /proc/sys/vm/swappiness
# Alternatively, using sysctl
sysctl -w vm.swappiness=1
# Verify the change
cat /proc/sys/vm/swappiness
1
# Alternatively, using sysctl
sysctl vm.swappiness
vm.swappiness = 1
# View the I/O scheduler setting. The value in square brackets shows the running scheduler
cat /sys/block/sda/queue/scheduler 
# Change the setting
sudo echo noop > /sys/block/sda/queue/scheduler
