#!/bin/bash
sudo pacman -S inxi
inxi -Fxz
echo "Hardware information displayed."
