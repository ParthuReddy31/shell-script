#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2)) #if you want print any dynamic values we have to mention $((condition))

echo "Addition of '$NUMBER1' and '$NUMBER2' is: $SUM "