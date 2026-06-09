#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/Shell_scripts"
LOGS_FILE="/var/log/Shell_scripts/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script as root user $N" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE () {
    if [ $? -ne 0 ]; then
        echo -e "$R $2... Failure $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$G $2... Success $N" | tee -a $LOGS_FILE
    fi
}

for pachage in $@ # sudo sh 14-loops.sh nginx mysql-server nodejs
do
    apt list installed $pachage &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo -e "$Y $pachage is not installed, installing Now $N"
        apt install $pachage -y &>>$LOGS_FILE
        VALIDATE $? "$pachage installation"
    else
        echo -e "$G $pachage is already installed, skipping installation $N"
    fi
done