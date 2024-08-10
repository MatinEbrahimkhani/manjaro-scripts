#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 filename"
  exit 1
fi

shred -u -v "$1"
echo "File $1 securely erased."
