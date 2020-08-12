#! /bin/bash

Rectangle_Area() {
  AREA=$(( $1 * $2 ))
  echo "Area is : $AREA"
}

Rectangle_Area 10 20
