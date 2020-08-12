#! /bin/bash

FILE='book.txt'
while read LINE; do
echo $LINE
done < $FILE
