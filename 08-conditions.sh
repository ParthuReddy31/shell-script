#!/bin/bash

NUMBER1=$1

# -gt(for greaterthan), -lt(for lessthan), -eq(equals to), -ge(for greaterthan or equals), -le(for lessthan or equals) 
if [ $NUMBER1 -gt 100 ]
then
    echo "the entered number is $NUMBER1 and it's greaterthan 100"
else 
    echo " the entered number is $NUMBER1 and it's lessthan or Equals 100"
fi 