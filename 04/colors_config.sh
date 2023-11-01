#!/bin/bash

export column1_background=6
export column1_font_color=3
export column2_background=3
export column2_font_color=6
export count=0

if [[ -n "$column1_background" && -n "$column1_font_color" && -n "$column2_background" && -n "$column2_font_color" ]]; then
  count=4
fi
