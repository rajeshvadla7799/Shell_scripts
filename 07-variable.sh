#!/bin/bash

###### special variables ######

echo "all arguments passed to the script:: $@"
echo "number of varibles passed to the script:: $#"
echo "script name:: $0"
echo "present directory:: $PWD"
echo "who is running the script:: $USER"
echo "home directory of current user:: $HOME"
echo "PID of the script:: $$"
sleep 100 &
echo "PID of the recently executed background process:: $!"
echo "all arguments passed to the script:: $*"