#! /bin/bash

echo Enter a number:
read n

if [ $n -lt 10 ];
then
echo "It is a one digit number."
else
echo "It is more than one digit."
fi
