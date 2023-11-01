#!/bin/bash

if [[ "$#" -eq 0 ]]; then
  source ./colors_config.sh
  if [[ "$count" -ne 4 ]]; then
    ./show_colors.sh default
  else
    ./status.sh $column1_background $column1_font_color $column2_background $column2_font_color
    ./show_colors.sh custom
  fi
elif [[ "$#" -eq 4 ]]; then
  ./status.sh "$@"
else
  printf "To run this script you can:\n  - Pass no parameters. In this case parameters from colors_config.sh will be used.\n  - Pass 4 parameters.\n"
fi
