#!/bin/bash
sudo bash -c 'echo "nameserver 1.1.1.1" > /etc/resolv.conf'
sudo bash -c 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf'
echo "Custom DNS set to Cloudflare and Google DNS."
