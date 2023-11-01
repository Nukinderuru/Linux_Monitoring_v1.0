#!/bin/bash

function getcolor()
{
  case "$1" in
    1) echo "white" ;;
    2) echo "red" ;;
    3) echo "green" ;;
    4) echo "blue" ;;
    5) echo "purple" ;;
    6) echo "black" ;;
  esac
}

function getdefault()
{
  echo "default"
}

export color1=$(getcolor "$1")
export color2=$(getcolor "$2")
export color3=$(getcolor "$3")
export color4=$(getcolor "$4")

if [[ "$5" == "-d" && "$#" -gt 5 && "$#" -lt 10 ]]; then
  while [ -n "$6" ]
  do
    case "$6" in
      1) export color1=$(getdefault) ;;
      2) export color2=$(getdefault) ;;
      3) export color3=$(getdefault) ;;
      4) export color4=$(getdefault) ;;
    esac
    shift
  done
fi
