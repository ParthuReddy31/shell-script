#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Error:: to install any package user must be Root "
    exit 1 #other than zero 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " $2 is FAILURE"
        exit 1
    else
        echo "$2 is SUCCESSFUL"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
    then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo "Git is already installed"
fi
