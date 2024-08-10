#!/bin/bash
sudo pacman -S bleachbit
sudo bleachbit --clean system.cache system.tmp
echo "Temporary files and cache cleaned."
