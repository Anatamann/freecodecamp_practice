#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
      echo  Please provide an element as an argument.
else    

if [[ $1 =~ ^[0-9]+$ ]]
then
      ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")

      if [[ -z $ATOMIC_NUMBER_RESULT ]]
      then
            echo "I could not find that element in the database."
       else
            echo "$ATOMIC_NUMBER_RESULT" | while IFS=\| read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
            do
                    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
           done         
       fi          
  fi    

          if [[ ! $1 =~ ^[0-9]+$ ]]
          then
               ATOMIC_NUMBER_RESULT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name LIKE '$1%' ORDER BY atomic_number LIMIT 1")
               if [[ -z $ATOMIC_NUMBER_RESULT ]]
      then
            echo "I could not find that element in the database."
       else
            echo "$ATOMIC_NUMBER_RESULT" | while IFS=\| read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
            do
                    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
           done         
       fi

            fi   
       fi     