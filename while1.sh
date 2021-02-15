#!/bin/bash
#set -xv
n=5

while [ $n -gt 0 ]
do
	sqrt=$((n*n))
	echo "the squre of $n is $sqrt"
	((n--))
done
