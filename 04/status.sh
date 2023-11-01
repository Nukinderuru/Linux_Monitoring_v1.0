#!/bin/bash
source set_colors.sh

function status()
{
  echo -e "$bgcolorname$textcolorname HOSTNAME =\033[00m$bgcolorval$textcolorval $HOSTNAME\033[00m"
  timezone=$(timedatectl | grep "Time zone" | awk '{print $3}')
  timezoneoffset=$(date +"%z")
  echo -e "$bgcolorname$textcolorname TIMEZONE =\033[00m$bgcolorval$textcolorval $timezone UTC $timezoneoffset\033[00m"
  echo -e "$bgcolorname$textcolorname USER =\033[00m$bgcolorval$textcolorval $USER\033[00m"
  echo -e "$bgcolorname$textcolorname OS =\033[00m$bgcolorval$textcolorval $OSTYPE\033[00m"
  date=$(date +"%d %B %Y %T")
  echo -e "$bgcolorname$textcolorname DATE =\033[00m$bgcolorval$textcolorval $date\033[00m"
  uptime=$(uptime -p)
  echo -e "$bgcolorname$textcolorname UPTIME =\033[00m$bgcolorval$textcolorval $uptime\033[00m"
  uptime=$(</proc/uptime)
  uptime=${uptime%%.*}
  echo -e "$bgcolorname$textcolorname UPTIME_SEC =\033[00m$bgcolorval$textcolorval $uptime\033[00m"
  ip a | grep "inet " > ips.txt
  ip=$(grep "enp*" ips.txt | awk '{print $2}')
  rm ip*.txt
  echo -e "$bgcolorname$textcolorname IP =\033[00m$bgcolorval$textcolorval $ip\033[00m"
  mask=$(ipcalc $ip | grep "Netmask" | awk '{print $2}')
  echo -e "$bgcolorname$textcolorname MASK=\033[00m$bgcolorval$textcolorval $mask\033[00m"
  gateway=$(ip route show | grep "default" | awk '{print $3}')
  echo -e "$bgcolorname$textcolorname GATEWAY =\033[00m$bgcolorval$textcolorval $gateway\033[00m"
  ramtotal=$(free -g | awk '/Mem:/{printf "%.3f Gb", $2/1024}')
  echo -e "$bgcolorname$textcolorname RAM_TOTAL =\033[00m$bgcolorval$textcolorval $ramtotal\033[00m"
  ramused=$(free -g | awk '/Mem:/{printf "%.3f Gb", $3/1024}')
  echo -e "$bgcolorname$textcolorname RAM_USED =\033[00m$bgcolorval$textcolorval $ramused\033[00m"
  ramfree=$(free -g |awk '/Mem:/{printf "%.3f Gb", $4/1024}')
  echo -e "$bgcolorname$textcolorname RAM_FREE =\033[00m$bgcolorval$textcolorval $ramfree\033[00m"
  space=$(df /root/ | awk '/\/$/{printf "%.2f Mb", $2/1024}')
  echo -e "$bgcolorname$textcolorname SPACE_ROOT =\033[00m$bgcolorval$textcolorval $space\033[00m"
  spaceused=$(df /root/ |awk '/\/$/{printf "%.2f Mb", $3/1024}')
  echo -e "$bgcolorname$textcolorname SPACE_ROOT_USED =\033[00m$bgcolorval$textcolorval $spaceused\033[00m"
  spacefree=$(df /root/ |awk '/\/$/{printf "%.2f Mb", $4/1024}')
  echo -e "$bgcolorname$textcolorname SPACE_ROOT_FREE =\033[00m$bgcolorval$textcolorval $spacefree\033[00m"
}
status
