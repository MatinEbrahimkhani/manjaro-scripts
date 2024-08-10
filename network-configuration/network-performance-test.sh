#!/bin/bash
sudo pacman -S iperf3
iperf3 -s &
iperf3 -c 192.168.1.1  # Replace with your router's IP address
ping -c 4 google.com
echo "Network performance test completed."
