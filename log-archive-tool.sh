#!/bin/bash

# Script: log-archive.sh
# Purpose: Archive logs from a specified directory, compress them, and log the operation.

# Check if the user provided a log directory
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1
ARCHIVE_DIR="/var/log/archives"
DATE_TIME=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_${DATE_TIME}.tar.gz"
LOG_FILE="/var/log/log-archive.log"

# Ensure the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Create the archive directory if it does not exist
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir -p "$ARCHIVE_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create archive directory '$ARCHIVE_DIR'."
        exit 1
    fi
fi

# Compress logs into the archive directory
TAR_PATH="$ARCHIVE_DIR/$ARCHIVE_FILE"
tar -czf "$TAR_PATH" -C "$LOG_DIR" .
if [ $? -ne 0 ]; then
    echo "Error: Failed to compress logs."
    exit 1
fi

# Log the operation
LOG_ENTRY="[$(date +"%Y-%m-%d %H:%M:%S")] Archived logs from '$LOG_DIR' to '$TAR_PATH'"
echo "$LOG_ENTRY" | tee -a "$LOG_FILE"

# Notify the user
echo "Logs have been archived to '$TAR_PATH'."

# End of script
