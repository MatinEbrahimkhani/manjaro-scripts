#!/bin/bash
if [ "$1" == "add" ]; then
  sudo useradd -m $2
  sudo passwd $2
  echo "User $2 added."
elif [ "$1" == "remove" ]; then
  sudo userdel -r $2
  echo "User $2 removed."
else
  echo "Usage: $0 {add|remove} username"
fi
