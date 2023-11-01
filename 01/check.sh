#!/bin/bash
source output.sh

function check()
{
  if [[ "$#" -ne 1 ]]; then
    echo "Wrong number of parameters"
    exit 0
  elif ! [[ -n "$1"  ]]; then
    echo "There must be 1 parameter"
    exit 0
  elif [[ "$1" == *[0-9]* ]]; then
    echo "Wrong parameter"
    exit 0
  else
    output "$1"
  fi
}
