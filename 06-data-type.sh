#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))

echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"

TIMESTAMP=$(date)

echo "Addition of 2 numbers script is executed at: $TIMESTAMP"