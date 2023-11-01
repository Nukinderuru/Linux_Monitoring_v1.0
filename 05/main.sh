#!/bin/bash
source status.sh

function check()
{
  if [[ "$#" -eq 1 ]]; then
    if [[ "$1" =~ /$ ]]; then
      if [[ -d "$1" ]]; then
        output "$1"
      else
	      echo "No such directory"
        exit 0
      fi
    else
      echo "The parameter must be a directory"
      exit 0
    fi
  else
    echo "There must be 1 parameter"
    exit 0
  fi
}

check "$@"
