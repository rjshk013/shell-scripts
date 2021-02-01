#!/bin/bash
sudo service apache2 stop
sudo apt-get --purge remove apache2
sudo apt-get autoremove
whereis apache2
