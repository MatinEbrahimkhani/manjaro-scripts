#!/bin/bash
cat <<EOF >> ~/.bashrc
alias ll='ls -la'
alias gs='git status'
alias gc='git commit -m'
EOF
source ~/.bashrc
echo "Aliases set up."
