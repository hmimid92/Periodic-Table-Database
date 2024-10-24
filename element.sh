#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]] 
then 
 echo "Please provide an element as an argument."
 else 
 ATOM_INFO() 
   {
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$1'")
    ATOMIC_NAME=$($PSQL "select name from elements where symbol='$1'")
    TYPE_ID=$($PSQL "select type_id from properties where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_TYPE=$($PSQL "select type from types where type_id=$TYPE_ID")
    ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_MELTING=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_BOILING=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")

    echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($1). It's a $ATOMIC_TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $ATOMIC_MELTING celsius and a boiling point of $ATOMIC_BOILING celsius."
   }

case $1 in
    1) ATOM_INFO "H" ;;
    H) ATOM_INFO "H" ;;
    Hydrogen) ATOM_INFO "H" ;;
    2) ATOM_INFO "He" ;;
    H) ATOM_INFO "He";;
    Helium) ATOM_INFO "He" ;;
    3) ATOM_INFO "Li" ;;
    Li) ATOM_INFO "Li" ;;
    Lithium) ATOM_INFO "Li" ;;
    4) ATOM_INFO "Be" ;;
    Be) ATOM_INFO "Be" ;;
    Beryllium) ATOM_INFO "Be" ;;
    5) ATOM_INFO "B" ;;
    B) ATOM_INFO "B" ;;
    Boron) ATOM_INFO "B" ;;
    6) ATOM_INFO "C";;
    C) ATOM_INFO "C" ;;
    Carbon) ATOM_INFO "C" ;;
    7) ATOM_INFO "N" ;;
    N) ATOM_INFO "N" ;;
    Nitrogen) ATOM_INFO "N" ;;
    8) ATOM_INFO "O" ;;
    O) ATOM_INFO "O" ;;
    Oxygen) ATOM_INFO "O" ;;
    9) ATOM_INFO "F" ;;
    F) ATOM_INFO "F" ;;
    Fluorine) ATOM_INFO "F" ;;
    10) ATOM_INFO "Ne" ;;
    Ne) ATOM_INFO "Ne" ;;
    Neon) ATOM_INFO "Ne" ;;
    *) echo "I could not find that element in the database." ;;
esac
fi
