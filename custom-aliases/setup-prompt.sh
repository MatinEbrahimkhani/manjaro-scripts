#!/bin/bash
cat <<EOF >> ~/.bashrc
PS1='\[\e[1;34m\]\u@\h:\[\e[1;32m\]\w\[\e[0m\]$ '
EOF
source ~/.bashrc
echo "Bash prompt customized."
