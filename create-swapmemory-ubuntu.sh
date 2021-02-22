#!/bin/bash
#Start by creating a file which will be used for swap:

sudo fallocate -l 2G /swapfile
#Only the root user should be able to write and read the swap file. Set the correct permissions by typing:
sudo chmod 600 /swapfile
#Use the mkswap utility to set up a Linux swap area on the file:

sudo mkswap /swapfile
#Activate the swap file using the following command:

sudo swapon /swapfile
To make the change permanent open the /etc/fstab file:

sudo nano /etc/fstab

and paste the following line:/swapfile swap swap defaults 0 0
Verify that the swap is active by using either the swapon or the free command , as shown below:

sudo swapon --show
