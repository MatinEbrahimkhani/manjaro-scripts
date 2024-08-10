#!/bin/bash
sudo pacman -S docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
echo "Docker installed. Log out and back in to use Docker without sudo."
