#!/bin/bash
sudo pacman -S go
mkdir -p ~/go/{bin,src,pkg}
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "Go installed and GOPATH set up."
