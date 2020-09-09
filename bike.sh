#! /bin/bash

########## Psql connection
USERNAME=freecodecamp
DATABASE=bikes
QUERY="psql -U $USERNAME $DATABASE -t -c"

########## PostgreSQL CRUD functions
GET_AVAILABLE_BIKES() {
  echo "`$QUERY "SELECT bike_id, type, size FROM bikes WHERE available=TRUE"`"
}

GET_CUSTOMER_NAME() {
  # argument $1 is a phone number
  echo "`$QUERY "SELECT name FROM customers WHERE phone='$1';"`"
}

ADD_CUSTOMER() {
  # argument $1 is a name
  # argument $2 is a phone number
  echo "`$QUERY "INSERT INTO customers (name, phone) values ('$1', '$2');"`"
}

RENT_BIKE() {
  # argument $1 is a phone number
  # argument $2 is a bike_id

  # get customer_id
  CUSTOMER_ID="`$QUERY "SELECT customer_id from customers WHERE phone='$1';"`"

  # insert rental for customer
  INSERT_RENTAL_RESULT="`$QUERY "INSERT INTO rentals (customer_id, bike_id) values ($CUSTOMER_ID, $2);"`"

  if [[ $INSERT_RENTAL_RESULT == "INSERT 0 1" ]]
  then
    # set available to false
    UPDATE_BIKE_AVAILABLE_RESULT="`$QUERY "UPDATE bikes SET available=false WHERE bike_id=$2;"`"

    # bike was successfully updated
    if [[ $UPDATE_BIKE_AVAILABLE_RESULT == "UPDATE 0 1" ]]
    then
      GET_BIKE_INFO_RESULT="`$QUERY "SELECT type, size FROM bikes WHERE bike_id=$2;"`"
    fi
  fi
  echo "$GET_BIKE_INFO_RESULT"
}

SHOW_TITLE() {
	clear
	echo "~~~~~~~~~~~~~~~~"	
	echo "BIKE RENTAL SHOP"
	echo "~~~~~~~~~~~~~~~~"
}

# Start of the user interface
MAIN_MENU() {
  SHOW_TITLE
  echo -e "\nHow can I help you?\n"
  echo -e "1. Rent a bike\n2. Return a bike"
  read MENU1
}

MAIN_MENU

if [[ $MENU1 == 1 ]];
then
  echo -e "\n\nHere's the bikes we have available for rent:\n"
  echo "$(GET_AVAILABLE_BIKES)"

  echo -e "\nEnter the number of the bike you would like to rent:"
  read BIKE_ID_TO_RENT

  echo -e "\nWhat's your phone number?"
  read PHONE_NUMBER

  # Query database for phone number
  NAME=$(GET_CUSTOMER_NAME $PHONE_NUMBER)

  echo "$NAME"

  # if phone number doesn't exist
  if [[ -z $NAME ]]
  then
    echo "I could not find your phone number"
    echo "What's your name?"

    read NAME2

    # Add them to the customer table
    ADD_CUSTOMER_RESULT=$(ADD_CUSTOMER $NAME2 $PHONE_NUMBER);

    if [[ $ADD_CUSTOMER_RESULT == "INSERT 0 1" ]]
    then
      echo "I have added you to our database";

      RENT_BIKE_RESULT=$(RENT_BIKE $PHONE_NUMBER $BIKE_ID_TO_RENT);

      echo "I have put you down for the $RENT_BIKE_RESULT"

    else
      echo "Something went wrong"
    fi

  else
    echo "Hello, $NAME"
  fi

elif [[ $MENU1 == 2 ]]

then
  echo "Whats your phone number?"
else
  echo "Made it to the else area"
fi

