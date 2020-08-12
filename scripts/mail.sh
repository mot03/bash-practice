#! /bin/bash

RECIPIENT="me@gmail.com"
SUBJECT="Hello World"
MESSAGE="I sent this from a bash script"
`mail -s $SUBJECT $RECIPIENT <<< $MESSAGE`
