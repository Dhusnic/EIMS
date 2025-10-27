#!/bin/bash
THRESHOLD=90
# Check usage for /
USAGE=$(df -h / | awk 'NR==2 { print $5 }' | sed 's/%//')
if [ "$USAGE" -ge "$THRESHOLD" ]; then
  # Action to execute your script here, e.g.:
  /opt/scripts/LogManagement/delete_indices_https.sh http 0.0.0.0 elastic elastic 2
fi

