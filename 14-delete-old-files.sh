#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\033[0;35m"
N="\e[0m"

USERID=$(id -u)

SOURCE_DIRECTORY="/home/ec2-user/app-logs"

# LOGS_FOLDER="/var/log/shellscript-logs"
# LOG_FILE=$(echo $0 | cut -d "." -f1)
# LOG_TIMESTAMP=$(date +%y-%m-%d)
# LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$LOG_TIMESTAMP.log"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R  $2 is FAILURE $N"
        exit 1
    else
        echo -e "$G $2 is  SUCCESSFUL $N"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: You must have sudo access to execute this script"
        exit 1 #other than 0
    fi
}

echo "Script Started Executing at $TIMESTAMP " &>>LOG_FILE_NAME

FILES_TO_DELETE $(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)
echo "files to be Deleted: $FILES_TO_DELETE"
