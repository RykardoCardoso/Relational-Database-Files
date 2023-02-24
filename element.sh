#!/bin/bash

# Script to query data in periodic table database

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PRINT_MSG() {
  # get available information about the element
  AVAILABLE_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$CURRENT_ELEMENT_AN")
  #echo $AVAILABLE_INFO

  # display available services
  echo "$AVAILABLE_INFO" | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

# if first argument does not exist
if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
  else

     # if input is a number
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      #get atomic number
      GET_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")

      # if not found
      if [[ -z $GET_ATOMIC_NUMBER ]]
      then
        echo "This atomic number ($GET_ATOMIC_NUMBER) does not exist!"
      else
        CURRENT_ELEMENT_AN=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
        #echo "This is an atomic number: $GET_ATOMIC_NUMBER"
        #echo "AN: $CURRENT_ELEMENT_AN"
        PRINT_MSG
      fi

    else
      #get Symbol
      GET_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'")

      # if not found
      if [[ -z $GET_SYMBOL ]]
      then
      
        #get name
        GET_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'")

        # if not found
        if [[ -z $GET_NAME ]]
        then
          echo "I could not find that element in the database."
        else
          CURRENT_ELEMENT_AN=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
          #echo "This is a name: $GET_NAME"
          #echo "AN: $CURRENT_ELEMENT_AN"
          PRINT_MSG
        fi

      else
        CURRENT_ELEMENT_AN=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
        #echo "This is a symbol: $GET_SYMBOL"
        #echo "AN: $CURRENT_ELEMENT_AN"
        PRINT_MSG
      fi

    fi

fi