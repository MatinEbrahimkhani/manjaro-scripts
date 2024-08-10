#!/bin/bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
echo "Firewall is enabled and SSH is allowed."
