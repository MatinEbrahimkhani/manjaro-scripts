#!/bin/bash
THRESHOLD=80

df -H | awk '{ print $5 " " $1 }' | while read output; do
  usage=$(echo $output | awk '{ print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{ print $2 }')

  if [ $usage -ge $THRESHOLD ]; then
    echo "Warning: High disk usage on $partition ($usage%)"
  fi
done
