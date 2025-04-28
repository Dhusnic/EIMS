#!/bin/bash

# Log file
LOG_FILE="$HOME/infraon_backend_api.log"
echo "========== Managing Infraon Backend API ==========" >> "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE"

# Step 1: Navigate to directory
TARGET_DIR="/data/opt/instancerepo/Infraon/infraon_backend_api"
echo "Navigating to $TARGET_DIR..." >> "$LOG_FILE"
cd "$TARGET_DIR" || { echo "Failed to navigate to $TARGET_DIR" >> "$LOG_FILE"; exit 1; }

# Step 2: Check if PM2 service exists
PROCESS_NAME="Infraon_backend_api"
PM2_STATUS=$(pm2 status "$PROCESS_NAME" 2>/dev/null)

if echo "$PM2_STATUS" | grep -q "$PROCESS_NAME"; then
  echo "PM2 process '$PROCESS_NAME' exists." >> "$LOG_FILE"

  if echo "$PM2_STATUS" | grep -q "stopped"; then
    echo "Process is in stopped state. Restarting..." >> "$LOG_FILE"
    pm2 restart "$PROCESS_NAME" >> "$LOG_FILE" 2>&1
  else
    echo "Process is already running. No action needed." >> "$LOG_FILE"
  fi
else
  echo "No existing PM2 process found. Starting new one..." >> "$LOG_FILE"
  pm2 start npm --name "$PROCESS_NAME" -- start >> "$LOG_FILE" 2>&1
fi

# Save PM2 process list
pm2 save >> "$LOG_FILE" 2>&1

echo "========== Script Complete ==========" >> "$LOG_FILE"

