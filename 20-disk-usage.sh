#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 # In real projects it will be for monitoring 70% or 80%
MSG="" # Dont know why we need to write this ???


while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1) # Here variable USAGE is related to 6th column name Use% which we are tryign to read
    #In above line "cut" command is used for cutting % shown against every percentage so that we can compare the usage % number is <5 (ignore) or >5(mail/monitor) 
    #PARTITION=$(echo $line | awk -F " " '{print $7F}') -- Siva script
    #echo "Partition: $PARTITION, Usage: $USAGE" --- siva script
    MOUNT_FOLDER=$(echo $line | awk -F " " '{print $7F}')
    echo "MountFolder: $MOUNT_FOLDER, Usage: $USAGE"

    # For comparing something we always need to write condition
    if [ $USAGE -ge $DISK_THRESHOLD ] #Here -ge means greater than or equal to     
    then
        MSG+="High Disk usage on mount folder: $MOUNT_FOLDER Usage is: $USAGE \n "
    fi
done <<< $DISK_USAGE

echo -e "Message: $MSG" # -e means --> enabling 