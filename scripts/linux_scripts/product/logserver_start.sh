#!/bin/bash

# Log file
LOG_FILE="$HOME/log_management.log"
echo "========== Starting Log Management Script ==========" >> "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE"

# Step 1: Create a new screen session named "Log Management"
echo "Creating screen session 'Log_Management'..." >> "$LOG_FILE"

# Spaces in screen names aren't allowed, so using underscore instead

screen -dmS Log_Server bash -c 'LOG_FILE="$HOME/log_server.log"; echo "Inside screen session at $(date)" >> "$LOG_FILE"; echo "Navigating to /data/opt/LogServer/" >> "$LOG_FILE"; cd /data/opt/LogServer/ || { echo "Directory not found!" >> "$LOG_FILE"; exit 1; }; echo "Running yarn start..." >> "$LOG_FILE"; yarn start >> "$LOG_FILE" 2>&1'



if [ $? -eq 0 ]; then
  echo "Screen session 'Log_Server' started successfully." >> "$LOG_FILE"
else
  echo "Failed to create or run inside screen session." >> "$LOG_FILE"
fi

# Step 4: Screen is already detached via -dmS

# Step 5: Clear terminal
clear

tail -f "$LOG_FILE"
echo "Terminal cleared." >> "$LOG_FILE"

echo "========== Script Execution Complete ==========" >> "$LOG_FILE"

