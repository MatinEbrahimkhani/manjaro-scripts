#!/bin/bash
SOURCE="/path/to/backup/location"
sudo rsync -aAXv $SOURCE/ /
echo "System restore completed."
