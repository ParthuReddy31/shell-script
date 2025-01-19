#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\033[0;35m"
N="\e[0m"

USERID=$(id -u)

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

echo "Script Started Executing at $LOG_TIMESTAMP " &>>LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo -e " $P Error:: to install any package user must be Root $N " &>>LOG_FILE_NAME
    exit 1 #other than zero 0
fi

dnf list installed mysql &>>LOG_FILE_NAME
if [ $? -ne 0 ]
    then
    dnf install mysql -y &>>LOG_FILE_NAME
    VALIDATE $? "Installing MySQL" 
else
    echo -e "$G MySQL is already installed  $N" 
fi

dnf list installed git &>>LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>LOG_FILE_NAME
    VALIDATE $? "Installing GIT" 
else
    echo -e "$G Git is already installed $N" 
fi

