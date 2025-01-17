#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: to install any package user must be Root "
else
    dnf install mysqld -y
