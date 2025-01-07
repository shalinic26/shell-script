#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 # In real projects it will be for monitoring 70% or 80%

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}') # Here variable USAGE is related to 6th column name Use% which we are tryign to read
    #PARTITION=$(echo $line | awk -F " " '{print $7F}') -- Siva script
    #echo "Partition: $PARTITION, Usage: $USAGE" --- siva script
    MOUNTEDON=$(echo $line | awk -F " " '{print $7F}')
    echo "MountedOn: $MOUNTEDON, Usage: $USAGE"
done <<< $DISK_USAGE
