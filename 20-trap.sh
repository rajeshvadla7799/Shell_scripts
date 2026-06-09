#!/bin/bash

set -e

LOGS_FOLDER="/var/log/Shell_scripts"
mkdir -p $LOGS_FOLDER

LOGS_FILE="$LOGS_FOLDER/20-trap.log"

trap 'echo "Error occurred at line $LINENO: $BASH_COMMAND" | tee -a $LOGS_FILE' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run as root user"
    exit 1
fi

for package in "$@"
do
    echo "Processing: $package" | tee -a $LOGS_FILE

    if ! dpkg -s "$package" &>>$LOGS_FILE; then
        echo "$package is not installed, installing now" | tee -a $LOGS_FILE

        apt install "$package" -y &>>$LOGS_FILE

        echo "$package installation SUCCESS" | tee -a $LOGS_FILE
    else
        echo "$package already installed, skipping" | tee -a $LOGS_FILE
    fi
done