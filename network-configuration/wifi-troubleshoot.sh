#!/bin/bash
sudo systemctl restart NetworkManager
nmcli device wifi rescan
echo "Wi-Fi troubleshooted. Rescanned for available networks."
