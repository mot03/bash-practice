#! /bin/bash

echo "Enter an integer greater than zero:"
read NUMBER
printf "\n"

for (( COUNTER=$NUMBER; COUNTER>0; COUNTER-- ))
do
echo $COUNTER
sleep 1
done

echo "Finished!"
sleep 1
printf "\n"
