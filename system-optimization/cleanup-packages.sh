#!/bin/bash
# shellcheck disable=SC2046
sudo pacman -Rns $(pacman -Qdtq)
echo "Orphaned packages removed."
