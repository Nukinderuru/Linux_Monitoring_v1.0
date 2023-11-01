#!/bin/bash

if [[ "$#" -ne 4 ]]; then
  echo "There should be 4 parameters, you put "$#"."
  exit 0
fi
if [[ "$1" == "$2" || "$3" == "$4" ]]; then
  echo -n "Background and text colour shouldn't be the same. Would you like to try
  again? Y/N "
  read
  if [[ "$REPLY" == *[Yy]* ]]; then
    echo -n "Please type new parameters: "
    read params
    ./main.sh $params
    exit 0
  else
    exit 0
  fi
fi

count=1
while [ -n "$1" ]
do
  if [[ "$1" != *[1-6]* || "$1" -lt 0 ]]; then
    echo "Wrong parameters: "$1""
    exit 0
  elif [[ "$count" == 1 ]]; then
    export bgcolorname="$1"
  elif [[ "$count" == 2 ]]; then
    export textcolorname="$1"
  elif [[ "$count" == 3 ]]; then
    export bgcolorval="$1"
  elif [[ "$count" == 4 ]]; then
    export textcolorval="$1"
  fi
  shift
  count=$(( $count + 1 ))
done
