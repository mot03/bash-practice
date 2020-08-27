#! /bin/bash


for ((I=1; I<3; I++))
do
psql -U freecodecamp postgres -c "CREATE DATABASE db$I"
done