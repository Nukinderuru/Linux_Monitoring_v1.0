#!/bin/bash

if [[ "$1" = "custom" ]]; then
  source ./colors_config.sh
  source ./get_color.sh "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"
elif [[ "$1" = "default" ]]; then
  source ./colors_default.sh
  source ./use_default_colors.sh "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"
fi
printf "\n"
echo "Column 1 background = $column1_background ($color1)"
echo "Column 1 font color = $column1_font_color ($color2)"
echo "Column 2 backgrpund = $column2_background ($color3)"
echo "Column 2 font color = $column2_font_color ($color4)"
