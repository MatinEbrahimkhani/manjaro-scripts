#!/bin/bash
sudo pacman -S tlp
sudo systemctl enable tlp
sudo systemctl start tlp
echo "TLP installed and enabled for power management."
