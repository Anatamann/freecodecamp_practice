#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
exec 2> error_log.txt
#query functions
QUERY(){
  
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    is_present=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    if [[ -z $is_present ]]
    then
      echo "I could not find that element in the database."
      exit 1
    else
      ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
      echo $ELEMENT | while IFS='|' read type_id atomic_number atomic_mass melting_point boiling_point symbol name type
      do 
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
      done
    fi
  elif [[ $2 -le 2 ]]
  then
  is_present=$($PSQL "SELECT name FROM elements WHERE symbol = '$1'")
    if [[ -z $is_present ]]
    then
      echo "I could not find that element in the database."
      exit 1
    else
      ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
      echo $ELEMENT | while IFS='|' read type_id atomic_number atomic_mass melting_point boiling_point symbol name type
      do 
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
      done
    fi
  else
    is_present=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
    if [[ -z $is_present ]]
    then
      echo "I could not find that element in the database."
      exit 1
    else
    ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name ='$1'")
      echo $ELEMENT | while IFS='|' read type_id atomic_number atomic_mass melting_point boiling_point symbol name type
      do 
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
      done
    fi
  fi
}

#error correction of database
# TYPE_PRESENT=$($PSQL "SELECT type from properties LIMIT 1")
# if [[ -n $TYPE_PRESENT ]]
# then
#   $PSQL "ALTER TABLE properties DROP COLUMN type" 
# fi

#fixing the out of range elements within the database
ATOMIC_NO=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=1000")
if [[ -n $ATOMIC_NO ]]
then
  $PSQL "DELETE FROM properties WHERE atomic_number=1000" 
  $PSQL "DELETE FROM elements WHERE atomic_number=1000" 
fi

#argument checking logic
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else  
  ARG=$1
  LEN=${#ARG}
  QUERY $ARG $LEN
fi