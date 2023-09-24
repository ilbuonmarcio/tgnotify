#!/bin/zsh

apt update &> /dev/null

echo "$(uname -n): $(uptime --pretty)"
echo "Updates available: $(apt list --upgradable 2> /dev/null | sed 1,1d | wc -l)"

ALERT=5
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r output;
do
  usep=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo "$output" | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo "WARN: Running out of space \"$partition ($usep%)\"" 
  fi
done
