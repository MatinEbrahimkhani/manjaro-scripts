#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 username"
  exit 1
fi

sudo passwd $1
echo "Password for user $1 reset."
