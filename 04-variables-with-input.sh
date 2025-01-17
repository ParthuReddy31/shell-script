#!/bin/bash

echo " please enter you username ===>: " #here, the text entered will be cosidered as name variable
read USERNAME
echo " entered name is ===>" $USERNAME

echo " please enter you password ===>: " #here, the text entered will be cosidered as password variable
read -s PASSWORD
echo " you entered the password"  #$PASSWORD  #just printing the password to check