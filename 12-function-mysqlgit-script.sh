#!/bin/bash

USERID=$(id -u)

VALIDATE(){                 # This function needs previous command's (dnf install mysql -y) exit status as Input
if [ $1 -ne 0 ]             # -> $1 will have exit status of previous command i.e. dnf install mysql -y is previous command
    then
        echo "$2.....FAILURE"
        exit 1
    else
        echo "$2......SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR: You must have sudo access to execute this script"
    exit 1 # other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ] # that means sql is not installed
then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"   # 2 arguments we are passing to function , 1st arg what is exit status code of previous command and 2nd arg is what i was trying to do in previous statement i am mentioning
    
else
    echo "MySQL is already......INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
    
else
    echo "Git is already......INSTALLED"
fi

