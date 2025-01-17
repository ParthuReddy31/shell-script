#!/bin/bash
echo "printing all number that entered: $@"    #if you want to print all the numbers that you entered, use " $@ "
echo "printing how many number that entered: $#"   #if you want to print how many numbers that you entered, use " $# " 
echo "printing the script name: $0" #to print Script name
echo "printing the present working directory: $PWD"
echo "printing home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "process id of current script: $$ "

sleep 60 &
echo "process id of last command in the background $! "