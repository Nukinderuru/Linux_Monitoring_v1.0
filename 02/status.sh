#!/bin/bash

function status()
{
  echo "HOSTNAME = $HOSTNAME"
  timezone=$(timedatectl | grep "Time zone" | awk '{print $3}')
  timezoneoffset=$(date +"%z")
  echo "TIMEZONE = $timezone UTC $timezoneoffset"
  echo "USER = $USER"
  echo "OS = $OSTYPE"
  date=$(date +"%d %B %Y %T")
  echo "DATE = $date"
  uptime=$(uptime -p)
  echo "UPTIME = $uptime"
  uptime=$(</proc/uptime)
  uptime=${uptime%%.*}
  echo "UPTIME_SEC = $uptime"
  ip a | grep "inet " > ips.txt
  grep -v " lo" ips.txt > ip.txt
  ip=$(grep -v " docker" ip.txt | awk '{print $2}')
  rm ip*.txt
  echo "IP = $ip"
  mask=$(ipcalc $ip | grep "Netmask" | awk '{print $2}')
  echo "MASK = $mask"
  gateway=$(ip route show | head -1 | awk '{print $3}')
  echo "GATEWAY = $gateway"
  free -g | awk '/Mem:/{printf "RAM_TOTAL = %.3f GB\n", $2/1024}'
  free -g | awk '/Mem:/{printf "RAM_USED = %.3f GB\n", $3/1024}'
  free -g |awk '/Mem:/{printf "RAM_FREE = %.3f GB\n", $4/1024}'
  df /root/ | awk '/\/$/{printf "SPACE_ROOT = %.2f MB\n", $2/1024}'
  df /root/ |awk '/\/$/{printf "SPACE_ROOT_USED = %.2f MB\n", $3/1024}'
  df /root/ |awk '/\/$/{printf "SPACE_ROOT_FREE = %.2f MB\n", $4/1024}'
}
