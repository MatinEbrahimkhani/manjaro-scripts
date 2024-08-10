#!/bin/bash
DESTINATION="/path/to/backup/location"
EXCLUDES="--exclude=/proc --exclude=/tmp --exclude=/mnt --exclude=/dev --exclude=/sys"

sudo rsync -aAXv $EXCLUDES / $DESTINATION
echo "Backup completed."
