#!/bin/bash
DESTINATION="/mnt/backup/home"
rsync -av --delete ~/ $DESTINATION
echo "Home directory synced with $DESTINATION."
