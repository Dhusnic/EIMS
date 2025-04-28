#!/bin/bash

# Log file location
LOG_FILE="$HOME/infraon_ui.log"

echo "========== Starting Infraon_UI Script ==========" >> "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE"

# Step 0: Check and delete .angular directory if exists
ANGULAR_DIR="/data/opt/instancerepo/Infraon/infraon_ui/.angular"
if [ -d "$ANGULAR_DIR" ]; then
  rm -rf "$ANGULAR_DIR"
  echo ".angular directory found and deleted at $ANGULAR_DIR" >> "$LOG_FILE"
else
  echo ".angular directory not found at $ANGULAR_DIR" >> "$LOG_FILE"
fi

# Step 1: Create and start the screen session
echo "Creating and starting screen session 'Infraon_UI'..." >> "$LOG_FILE"
screen -dmS Infraon_UI bash -c '
  echo "Inside screen: $(date)" >> "$HOME/infraon_ui.log"
  cd /data/opt/instancerepo/Infraon/infraon_ui || {
    echo "Directory not found!" >> "$HOME/infraon_ui.log"
    exit 1
  }
  echo "Running npm start..." >> "$HOME/infraon_ui.log"
  npm start >> "$HOME/infraon_ui.log" 2>&1
'

if [ $? -eq 0 ]; then
  echo "Screen session 'Infraon_UI' started successfully." >> "$LOG_FILE"
else
  echo "Failed to start screen session." >> "$LOG_FILE"
fi

# Step 2: Detach is handled by -dmS (already detached)

# Step 3: Clear terminal
clear
echo "Terminal cleared." >> "$LOG_FILE"

echo "========== Script Execution Complete ==========" >> "$LOG_FILE"
echo "Check '$LOG_FILE' for logs."

