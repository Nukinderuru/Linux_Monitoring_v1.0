#!/bin/bash
source ./colors_config.sh
source ./colors_default.sh

if ! [[ -n "$column1_background" ]]; then
  column1_background="$column1_bg"
  d1=1
fi
if ! [[ -n "$column1_font_color" ]]; then
  column1_font_color="$column1_fc"
  d2=2
fi
if ! [[ -n "$column2_background" ]]; then
  column2_background="$column2_bg"
  d3=3
fi
if ! [[ -n "$column2_font_color" ]]; then
  column2_font_color="$column2_fc"
  d4=4
fi
./status.sh $column1_background $column1_font_color $column2_background $column2_font_color
source ./get_color.sh $column1_background $column1_font_color $column2_background $column2_font_color -d $d1 $d2 $d3 $d4
