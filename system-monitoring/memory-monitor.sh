#!/bin/bash
while true; do
  free -h | awk '/^Mem/ {print "Memory Usage: " $3 " / " $2}'
  sleep 5
done
