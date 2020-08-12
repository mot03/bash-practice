#! /bin/bash

function GREETING() {
  STR="Hello, $1"
  echo $STR
}

echo "Enter your name:"
read NAME

VAL=$(GREETING Tim)
echo "Return value of the function $VAL"
