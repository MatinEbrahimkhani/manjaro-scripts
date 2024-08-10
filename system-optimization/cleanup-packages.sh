#!/bin/bash
sudo pacman -Rns $(pacman -Qdtq)
echo "Orphaned packages removed."
