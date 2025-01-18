#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e " \033[0;35m Error:: to install any package user must be Root $N "
    exit 1 #other than zero 0
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\033[0;35m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R  $2 is FAILURE $N"
        exit 1
    else
        echo -e "$G $2 is  SUCCESSFUL $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
    then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "$G MySQL is already installed  $N"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo -e "$G Git is already installed $N"
fi

echo -e "$R red"
echo  " red"
echo -e "$G red"
echo -e "$P red"