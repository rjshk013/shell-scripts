#!/bin/bash
#Ensure secure ICMP redirects are not accepted
sudo su
sysctl -w net.ipv4.conf.all.secure_redirects=0 
sysctl -w net.ipv4.conf.default.secure_redirects=0 
sysctl -w net.ipv4.route.flush=1
#Ensure password expiration is 90 days or less
sudo chage -M 90 $USER
#Ensure IP forwarding is disabled
sysctl -w net.ipv4.ip_forward=0
sysctl -w net.ipv4.route.flush=1
#Ensure IPv6 is disabled
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
#Ensure local login warning banner is configured properly
echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue
grep "^LogLevel" /etc/ssh/sshd_config
#Install auditd on ubuntu
sudo apt-get install auditd -y

sudo systemctl start auditd
sudo systemctl enable auditd
#add rules for audit 
auditctl -w /var/log/lastlog -p wa -k logins
auditctl- w /var/run/faillock/ -p wa -k logins
auditctl -w /etc/passwd -p wa -k password-file
auditctl -w /etc/gshadow -p wa -k shadow-file
auditctl -w /var/log/lastlog -p wa -k lastlog-file
#Ensure file deletion events by users are collected
auditctl -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat  -S rmdir -k delete
auditctl -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat  -S rmdir -k delete
