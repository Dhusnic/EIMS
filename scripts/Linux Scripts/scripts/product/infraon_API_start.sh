#!/bin/bash

# Log file
LOG_FILE="$HOME/infraon_api.log"

echo "========== Starting Infraon_API Script ==========" >> "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE"

# Step 1: Start detached screen session with name "Infraon_api"
echo "Creating screen session 'Infraon_api'..." >> "$LOG_FILE"

screen -dmS Infraon_api bash -c '
  LOG_FILE="$HOME/infraon_api.log"
  echo "Inside screen session at $(date)" >> "$LOG_FILE"

  # Step 2: Navigate to Python environment folder
  echo "Navigating to /opt/infraonenv/bin" >> "$LOG_FILE"
  cd /opt/infraonenv/bin || { echo "Failed to cd to /opt/infraonenv/bin" >> "$LOG_FILE"; exit 1; }

  # Step 3: Activate Python environment
  echo "Activating Python environment..." >> "$LOG_FILE"
  source activate >> "$LOG_FILE" 2>&1

  # Step 4: Navigate to target script directory
  echo "Navigating to /data/opt/instancerepo/infraon_api/scripts/default_options" >> "$LOG_FILE"
  cd /data/opt/instancerepo/Infraon/infraon_api/scripts/default_options || {
    echo "Failed to cd to /data/opt/instancerepo/infraon_api/scripts/default_options" >> "$LOG_FILE"
    exit 1
  }

  echo "Setup complete inside screen." >> "$LOG_FILE"
'

if [ $? -eq 0 ]; then
  echo "Screen session 'Infraon_api' started successfully." >> "$LOG_FILE"
else
  echo "Failed to create screen session 'Infraon_api'." >> "$LOG_FILE"
fi

# Step 5: Detach is handled automatically with -dmS

# Step 6: Clear the terminal
clear
echo "Terminal cleared." >> "$LOG_FILE"

echo "========== Script Execution Complete ==========" >> "$LOG_FILE"
echo "Log saved to $LOG_FILE"
