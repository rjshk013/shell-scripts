#!/bin/bash
#To view the current swap setting
#sysctl -a | grep swap
#give swappiness 1 to kernel
sysctl -w vm.swappiness=1
# Make persistent across reboots by appending this line to the /etc/sysctl.conf file
echo “vm.swappiness=1” >> /etc/sysctl.conf
# Set the swappiness value as root
#echo 1 > /proc/sys/vm/swappiness
# Alternatively, using sysctl
#sysctl -w vm.swappiness=1
# Verify the change
#cat /proc/sys/vm/swappiness
#1
# Alternatively, using sysctl
#sysctl vm.swappiness
#vm.swappiness = 1
# View the I/O scheduler setting. The value in square brackets shows the running scheduler
cat /sys/block/sda/queue/scheduler 
# Change the setting
sudo echo noop > /sys/block/sda/queue/scheduler
#permanent
sed 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash elevator=deadline"/' /etc/default/grub
update-grub2
#Maximum percentage of active memory that can be dirty pages
sysctl -w vm.dirty_background_ratio=3
echo “vm.dirty_background_ratio=3” >> /etc/sysctl.conf
#Maximum percentage of total memory that can have dirty pages
sysctl -w vm.dirty_ratio=40
echo “vm.dirty_ratio=40” >> /etc/sysctl.conf
#How long to keep data in page cache before expiring
sysctl -w vm.dirty_expire_centisecs=500
echo “vm.dirty_expire_centisecs=500” >> /etc/sysctl.conf
#How often pdflush activates to clean dirty pages in hundredths of a seconds
sysctl -w vm.dirty_writeback_centisecs=100
echo “vm.dirty_writeback_centisecs=100” >> /etc/sysctl.conf
#increase open file limit to 500000
sysctl -w fs.file-max=500000
echo “fs.file-max=500000” >> /etc/sysctl.conf
