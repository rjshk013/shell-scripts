#!/bin/bash
#set -xv
for (( i=5; i>0; i-- ))
do
	sqrt=$((i*i))
	echo "the squre of $i is $sqrt"
done
