#!/bin/bash
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"

mkdir -p $ARCHIVE_DIR
find $LOG_DIR -type f -name "*.log" -exec mv {} $ARCHIVE_DIR \;
gzip $ARCHIVE_DIR/*.log
echo "Log files rotated and archived."
