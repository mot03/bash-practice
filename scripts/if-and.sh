#! /bin/bash

echo "Enter username:"
read USERNAME
echo "Enter password:"
read PASSWORD

if [[ ( $USERNAME == "admin" && $PASSWORD == "password" ) ]]
then
echo "success"
else
echo "try again"
fi
