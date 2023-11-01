#!/bin/bash
source check_params.sh "$@"
source color.sh
case "$bgcolorname" in
  1) bgcolorname="$bgwhite" ;;
  2) bgcolorname="$bgred" ;;
  3) bgcolorname="$bggreen" ;;
  4) bgcolorname="$bgblue" ;;
  5) bgcolorname="$bgpurple" ;;
  6) bgcolorname="$bgblack" ;;
esac
case "$textcolorname" in
  1) textcolorname="$white" ;;
  2) textcolorname="$red" ;;
  3) textcolorname="$green" ;;
  4) textcolorname="$blue" ;;
  5) textcolorname="$purple" ;;
  6) textcolorname="$black" ;;
esac
case "$bgcolorval" in
  1) bgcolorval="$bgwhite" ;;
  2) bgcolorval="$bgred" ;;
  3) bgcolorval="$bggreen" ;;
  4) bgcolorval="$bgblue" ;;
  5) bgcolorval="$bgpurple" ;;
  6) bgcolorval="$bgblack" ;;
esac
case "$textcolorval" in
  1) textcolorval="$white" ;;
  2) textcolorval="$red" ;;
  3) textcolorval="$green" ;;
  4) textcolorval="$blue" ;;
  5) textcolorval="$purple" ;;
  6) textcolorval="$black" ;;
esac
