#!/bin/bash

PSQL="psql -U freecodecamp -d periodic_table -t -c"

# if no argument
if [[ -z $1 ]]
  then
  # add input message and exit
  echo -e "Please provide an element as an argument."
  #else if arg is number
elif [[ $1 =~ ^[0-9]+$ ]]
  then
  QUERIED_ELEMENT=$( $PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1" )
  if [[ -z $QUERIED_ELEMENT ]]
    then
     echo "I could not find that element in the database."
  else
      echo $QUERIED_ELEMENT | while read NUMBER B NAME B SYM B TYPE B MASS B MELT B BOIL
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
      done
  fi
else
   QUERIED_ELEMENT_SYM=$( $PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'" )
if [[ -z $QUERIED_ELEMENT_SYM ]]
  then
      QUERIED_ELEMENT_NAME=$( $PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'" )
      if [[ -z $QUERIED_ELEMENT_NAME ]]
        then 
          echo "I could not find that element in the database."
      else
        echo $QUERIED_ELEMENT_NAME | while read NUMBER B NAME B SYM B TYPE B MASS B MELT B BOIL
        do
          echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
        done
      fi
  else
      echo $QUERIED_ELEMENT_SYM | while read NUMBER B NAME B SYM B TYPE B MASS B MELT B BOIL
      do
        echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
      done
  fi


fi