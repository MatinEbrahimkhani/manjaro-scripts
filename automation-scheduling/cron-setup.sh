#!/bin/bash
if [ "$1" == "add" ]; then
  crontab -l > mycron
  echo "$2 $3" >> mycron
  crontab mycron
  rm mycron
  echo "Cron job added."
elif [ "$1" == "list" ]; then
  crontab -l
elif [ "$1" == "remove" ]; then
  crontab -l | grep -v "$2" > mycron
  crontab mycron
  rm mycron
  echo "Cron job removed."
else
  echo "Usage: $0 {add|list|remove} [cron-job] [schedule]"
fi
