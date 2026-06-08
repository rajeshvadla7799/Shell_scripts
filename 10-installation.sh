#!/bin/bash

USERID=$(id -u)
echo "USERID=$USERID"

if [ $USERID -eq 0 ]; then
    echo "please run this script as root user"
    exit 1
fi

echo "installing nginx web server"
apt update -y
apt install nginx -y

if  [ $? -ne 0 ]; then
    echo "installing Nginx ... Failure"
     exit 1
else
    echo "installing Nginx ... Success"
fi