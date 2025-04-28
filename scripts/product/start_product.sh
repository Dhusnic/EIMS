#!/bin/bash

SCRIPTS_DIR="/opt/scripts/product"
LOG_FILE="$HOME/master_script.log"

echo "========== Running Master Script ==========" >> "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE"

# Step 1: List and kill all screen sessions except 'logserver'
echo "Checking running screen sessions..." >> "$LOG_FILE"
SCREEN_LIST=$(screen -ls | grep -oP '[0-9]+\.([^\t ]+)' | cut -d'.' -f2)

for screen_name in $SCREEN_LIST; do
  if [[ "$screen_name" != "logserver" ]]; then
    echo "Killing screen session: $screen_name" >> "$LOG_FILE"
    screen -S "$screen_name" -X quit
  else
    echo "Preserving screen session: logserver" >> "$LOG_FILE"
  fi
done

# Step 2: Ask user if they want to restart logserver
read -p "Do you want to restart the logserver? (y/n): " RESTART_LOG

if [[ "$RESTART_LOG" == "y" || "$RESTART_LOG" == "Y" ]]; then
  echo "User chose to restart logserver." >> "$LOG_FILE"

  # Kill the Log_Management screen if it exists
  if screen -ls | grep -q "Log_Management"; then
    echo "Killing screen session: Log_Management" >> "$LOG_FILE"
    screen -S Log_Management -X quit
  fi

  echo "Starting logserver_start.sh..." >> "$LOG_FILE"
  bash "$SCRIPTS_DIR/logserver_start.sh"
else
  echo "User chose NOT to restart logserver." >> "$LOG_FILE"
fi

# Step 3: Run the rest of the service scripts
echo "Running infraon_API_start.sh..." >> "$LOG_FILE"
bash "$SCRIPTS_DIR/infraon_API_start.sh"

echo "Running infraon_backend_api_start.sh..." >> "$LOG_FILE"
bash "$SCRIPTS_DIR/infraon_backend_api_start.sh"

echo "Running infraon_UI_start.sh..." >> "$LOG_FILE"
bash "$SCRIPTS_DIR/infraon_UI_start.sh"

echo "========== Master Script Complete ==========" >> "$LOG_FILE"

