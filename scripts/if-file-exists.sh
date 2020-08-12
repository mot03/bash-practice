#! /bin/bash

FILENAME=$1

if [ -f "$FILENAME" ]
then
  echo "File $FILENAME exists"
else
  echo "File does not exist"
fi
