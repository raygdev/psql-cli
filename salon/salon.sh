#!/bin/bash
PSQL="psql -U freecodecamp -d salon -t -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
   then 
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help?\n"
  fi
  SERVICES=$( $PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) APPOINTMENTS ;;
    2) APPOINTMENTS ;;
    3) APPOINTMENTS ;;
    4) APPOINTMENTS ;;
    5) APPOINTMENTS ;;
    *) MAIN_MENU "I could not find that service. What would you like today?"
  esac
}

APPOINTMENTS(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  
  CUSTOMER_NAME=$( $PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" )
  # if we can't find a customer
  if [[ -z $CUSTOMER_NAME ]]
      then
        # get customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # insert name and phone number into customers
        INSERT_CUSTOMER_RESULT=$( $PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')" )
        # get the customer id for inserting appointments
        CUSTOMER_ID=$( $PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" )
      else
        CUSTOMER_ID=$( $PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  fi
  # get service name
  SERVICE=$( $PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" )
  echo -e "\nWhat time would you like your $(echo $SERVICE | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME
  # insert appointment
  INSERTED_APPOINTMENT=$( $PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" )
  
  echo -e "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  
  }

  MAIN_MENU