#! /bin/bash

echo "Enter a number:"; read N; if [[ ( $N -eq 15 || $N -eq 45 ) ]];
then
echo "You found one of the secret numbers";
else
echo "Try again";
fi
