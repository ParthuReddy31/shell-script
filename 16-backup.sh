#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=${3:-14}  # if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    #echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    echo -e "$R Entered command is wrong, $Y Please follow USAGE command style$N"
    echo -e "$R USAGE:: $N backup <SOURCE_DIRECTORY> <DEST_DIRECTORY> <DAYS(Optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ];
then
    USAGE
fi

if [ ! -d $SOURCE_DIRECTORY ]
then
    echo -e "$R The Provided $N $SOURCE_DIRECTORY $R<-- Source Directory Does Not Exist... Please Check.!$N"
    exit 1
elif [ ! -d $DESTINATION_DIRECTORY ]
then
    echo -e "$R The Provided $N $DESTINATION_DIRECTORY $R<-- Destination Directory Does Not Exist... Please Check.!$N"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
    echo "Files are: $FILES"
    ZIP_FILE=$DESTINATION_DIRECTORY/app-logs-$TIMESTAMP.zip
    find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "$G Successfully created Zip file for .log files older than $DAYS $N"
        while read -r file
        do
            echo "Deleting file:-> $file"
            rm -rf $file
        done <<< $FILES
    else
        echo -e "$R ERROR:: $Y Failed to create Zip File $N"
    fi
else
    echo -e "$Y NO files found older than $DAYS"
fi