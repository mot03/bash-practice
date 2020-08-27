#! /bin/bash

USERNAME=freecodecamp
DATABASE=bikes
QUERY="psql -U $USERNAME $DATABASE -t -c"

GET_AVAILABLE_BIKES() {
  echo "`$QUERY "SELECT bike_id, type, size FROM bikes WHERE available=TRUE"`"
}

# argument $1 is a phone number
GET_CUSTOMER_NAME() {
  echo "`$QUERY "SELECT name FROM customers WHERE phone='$1';"`"
}

# argument $1 is a name
# argument $2 is a phone number
ADD_CUSTOMER() {
  echo "`$QUERY "INSERT INTO customers (name, phone) values ('$1', '$2');"`"
}

# argument $1 is a phone number
# argument $2 is a bike_id
RENT_BIKE() {
  # get customer_id
  CUSTOMER_ID="`$QUERY "SELECT customer_id from customers WHERE phone='$1';"`"

  # insert rental for customer
  echo "`$QUERY "INSERT INTO rentals (customer_id, bike_id) values ($CUSTOMER_ID, $2);"`"
}

# Start of the user interface
echo -e "\nHow can I help you?\n"
echo -e "1. Rent a bike\n2. Return a bike"
read MENU1

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

      if [[ $RENT_BIKE_RESULT == "INSERT 0 1" ]]
      then 
        echo "I have put you down for the 27\" mountain bike"
      fi
    else
      echo "Something went wrong"
    fi

  else
    echo "Hello, $NAME"
  fi
  
  # If exists, tell them thank you

  # If not exists, get there name and add them to the database








elif [[ $MENU1 == 2 ]]

then
  echo "Whats your phone number?"
else
  echo "Made it to the else area"
fi

