#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){                 # This function needs previous command's (dnf install mysql -y) exit status as Input
    if [ $1 -ne 0 ]             # -> $1 will have exit status of previous command i.e. dnf install mysql -y is previous command
    then
        echo -e "$2.....$R FAILURE $N"
        exit 1
    else
        echo -e "$2......$G SUCCESS $N"
    fi
}

mkdir -p $LOGS_FOLDER
# VALIDATE $? "Creating shell script logs directory"

USAGE(){
    echo -e "$R USAGE:: $N sh 19-Logs-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then    
    echo -e "$SOURCE_DIR Does not exists....Please check"
    exit 1
fi


if [ ! -d $DEST_DIR ]
then    
    echo -e "$DEST_DIR Does not exists....Please check"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
