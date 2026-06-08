#!/bin/bash

USERID=$(id -u)
echo "USERID=$USERID"

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

VALIDATE () {
    if [ $? -ne 0 ]; then
        echo "$2... Failure"
    exit 1
    else
        echo "$2... Success"
    fi
}

apt install nginx -y
VALIDATE $? "Installing Nginx"

apt install mysql-server -y
VALIDATE $? "Installing MySQL"

apt install nodejs -y
VALIDATE $? "Installing Node.js"