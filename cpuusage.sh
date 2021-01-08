#!/bin/bash
CPUUSAGE=$(top -b -n 1  | head -5 |  awk 'FNR == 3 {print $2}' | sed -e 's/us,//g' )
echo cpu usage in percentage $CPUUSAGE

