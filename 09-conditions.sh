#!/bin/bash

NUMBER=$1

echo "Entered number is: $NUMBER"

if [ $NUMBER -gt 100 ]
then
    echo "Given number is greater than 100"
else
    echo "Given number is less than or equal to 100"
fi

#echo "Enter a number:"

#read -s NUMBER

#echo "Number entered is: $NUMBER"

#if [ $NUMBER -gt 100 ]
#then
 #   echo "Number is greater than 100"
#else
 #   echo "Number is less than or equal to 100"
#fi
