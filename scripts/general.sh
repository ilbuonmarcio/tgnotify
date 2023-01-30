#!/bin/zsh

pacman -Sy &> /dev/null

echo "Host: $(uname -n)\n"
echo "Operating System: $(cat /etc/*-release | grep "^NAME=" | sed -e 's/NAME=//g' | sed -e 's/\"//g')\n"
echo "Uptime: $(uptime --pretty)\n(since $(uptime --since))\n"
echo "Load averages: $(uptime | grep -ohe 'load average[s:][: ].*' | awk '{ print $3, $4, $5 }')\n"
echo "Memory status (Installed/Available/Free): $(lsmem | grep "Total online memory" | awk '{print $4}' | sed -e 's/G//g').0G / $(free -h -w | head -n 2 | tail -n 1 | awk '{print $2" / "$8}' | sed -e 's/i//g')\n"
echo "Available addresses:\n\n$(ip addr | grep 'inet ' | grep -v 'host lo' | grep -v 'br-' | grep -v 'docker0' | awk '{print "IP: "$2"\tBroadcast: "$4}')\n"
echo "Disks status:\n\n$(df -h | head -n 1; df -h | grep '^/dev')\n"
echo "Containers running:\n\n$(docker ps --format '{{.Names}}, {{.Status}}')\n"
echo "Updates available ($(pacman -Qu | wc -l)):\n\n$(pacman -Qu)"
