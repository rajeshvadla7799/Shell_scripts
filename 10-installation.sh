#!/bin/bash

USERID=$(id -u)
echo "USERID=$USERID"

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi

echo "Installing nginx web server"

apt update -y
apt install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing Nginx ... Failure"
    exit 1
else
    echo "Installing Nginx ... Success"
fi