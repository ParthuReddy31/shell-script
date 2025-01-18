#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$M Error:: to install any package user must be Root "
    exit 1 #other than zero 0
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
M='\033[0;35m' 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R  $2 is FAILURE"
        exit 1
    else
        echo -e "$G $2 is  SUCCESSFUL"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
    then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "$G MySQL is already installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo -e "$G Git is already installed"
fi
