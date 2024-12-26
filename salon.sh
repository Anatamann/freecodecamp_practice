#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -c" 
echo -e "\n~~~ Welcome to our Salon ~~~\n"
echo -e "What would you like to get today?"
MAIN_MENU(){
  if [[ -n $1 ]]
  then
    echo -e "\n$1\n"
  fi
  table=$($PSQL "SELECT * FROM services")
  echo "$table" | while read SERVICE_ID NAME
  do
    if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    then
    echo -e "$SERVICE_ID) $NAME" | sed 's/ |//g'
    fi
  done
  echo -e "\nEnter your choice:"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    CUSTOMER_DETAILS $SERVICE_ID_SELECTED
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}  

CUSTOMER_DETAILS(){
  CHOICE=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE_IN_DB=$($PSQL "SELECT phone from customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $PHONE_IN_DB ]]
  then
    echo -e "\nWe don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  SERVICE_NAME=$($PSQL"SELECT name from services WHERE service_id=$CHOICE")
  CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nAt what time would you like to get your $SERVICE_NAME done, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$CHOICE,'$SERVICE_TIME')")
}

MAIN_MENU

