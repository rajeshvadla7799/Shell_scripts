#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/Shell_scripts"
LOGS_FILE="/var/log/Shell_scripts/$0.log"
echo "USERID=$USERID"

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

apt install nginx -y &>> $LOGS_FILE
VALIDATE $? "Installing Nginx"

apt install mysql-server -y &>> $LOGS_FILE    
VALIDATE $? "Installing MySQL"

apt install nodejs -y &>> $LOGS_FILE
VALIDATE $? "Installing Node.js"