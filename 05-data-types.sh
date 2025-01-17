#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2)) #if you want print any dynamic values we have to mention $((condition))
SUB=$(($NUMBER1-$NUMBER2))
MULTI=$(($NUMBER1*$NUMBER2))

echo "Addition of '$NUMBER1' and '$NUMBER2' is: $SUM "
echo "Subtraction of '$NUMBER1' and '$NUMBER2' is: $SUB "
echo "Multiplication of '$NUMBER1' and '$NUMBER2' is: $MULTI "

echo "printing all number that entered: $@"    #if you want to print all the numbers that you entered, use " $@ "
echo "printing how many number that entered: $#"   #if you want to print how many numbers that you entered, use " $# " 
echo "printing the script name: $0"