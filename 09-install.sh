#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: to install any package user must be Root "
    exit 1 #other than zero 0
fi

dnf install mysqld -y
if [ $? -ne 0 ]
then
    echo " installing MySQL... FAILURE"
    exit 1
else
    echo "the installation of MySQL is SUCCESSFUL"
fi

dnf install git -y
if [ $? -ne 0 ]
then
    echo " installing GIT... FAILURE"
    exit 1
else
    echo "the installation of GIT is SUCCESSFUL"
fi