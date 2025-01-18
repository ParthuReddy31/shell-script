#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: to install any package user must be Root "
    exit 1 #other than zero 0
fi

dnf list installed mysql
if [ $? -ne 0 ]
    then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo " installing MySQL... FAILURE"
        exit 1
    else
        echo "the installation of MySQL is SUCCESSFUL"
    fi
else
    echo "MySQL is already installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo " installing GIT... FAILURE"
        exit 1
    else
        echo "the installation of GIT is SUCCESSFUL"
    fi
else
    echo "Git is already installed"
fi