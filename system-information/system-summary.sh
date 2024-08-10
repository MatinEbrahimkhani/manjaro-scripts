#!/bin/bash
echo "System Information:"
uname -a

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -h

echo "Installed Packages:"
pacman -Q | wc -l

echo "Uptime:"
uptime -p

echo "System summary generated."
