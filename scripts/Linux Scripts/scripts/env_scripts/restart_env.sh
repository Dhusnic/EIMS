#!/bin/bash

# Constants
REPO_DIR="/data/opt/instancerepo/Infraon"
PULL_SCRIPT="/opt/scripts/product/pull_infraon.sh"
SCREEN_NAME="env"
LOG_FILE="/root/env.log"
RUN_DIR="infraon_service/infraon_devops"
RUN_SCRIPT="runserver.sh"

# Clear old logs
> "$LOG_FILE"
# Step 1: Run the Infraon pull script
if [ -x "$PULL_SCRIPT" ]; then
    "$PULL_SCRIPT"
else
    echo "Error: Pull script $PULL_SCRIPT not found or not executable."
    exit 1
fi

# Step 2: Kill existing screen session if it exists
if screen -list | grep -q "\.${SCREEN_NAME}[[:space:]]"; then
    echo "Killing existing screen session: $SCREEN_NAME"
    screen -S "$SCREEN_NAME" -X quit
fi

# Step 3: Start a new screen session to run the server
echo "Starting new screen session: $SCREEN_NAME"
screen -dmS "$SCREEN_NAME" bash -c "
  cd /opt/infraonenv/bin
  source activate
  cd '$REPO_DIR/$RUN_DIR' || exit 1
  chmod +x '$RUN_SCRIPT'
  source $RUN_SCRIPT >> '$LOG_FILE' 2>&1
"

tail -f $LOG_FILE

