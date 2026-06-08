#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/Shell_scripts"
LOGS_FILE="/var/log/Shell_scripts/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE () {
    if [ $? -ne 0 ]; then
        echo "$2... Failure" | tee -a $LOGS_FILE
    exit 1
    else
        echo "$2... Success" | tee -a $LOGS_FILE
    fi
}

for pachage in $@ # sudo sh 14-loops.sh nginx mysql-server nodejs
do
    apt install $pachage -y &>> $LOGS_FILE
    VALIDATE $? "$pachage installation"
done