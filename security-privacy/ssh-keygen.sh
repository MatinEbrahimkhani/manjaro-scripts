#!/bin/bash
read -p "Enter your email: " email
ssh-keygen -t rsa -b 4096 -C "$email"
echo "SSH key generated. You can add it to your GitHub/GitLab account."
