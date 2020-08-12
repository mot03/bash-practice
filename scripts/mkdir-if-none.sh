#! /bin/bash

echo "Enter directory name"
read NEWDIR

if [ -d "$NEWDIR" ]
then
  echo "Directory exists"
else
  mkdir $NEWDIR
echo "Directory \"$NEWDIR\" created"
fi
