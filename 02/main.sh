#!/bin/bash
source status.sh

status
echo -n "Do you want to save this statistic? Y/N "
read
if [[ $REPLY =~ ^[yY] ]]; then
  date=$(date +"%d_%m_%y_%H_%M_%S")
  status > $date.status
fi
