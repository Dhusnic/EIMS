#!/bin/bash

LOGFILE="/data/opt/deployment.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $1" | tee -a "$LOGFILE"
}

log "Starting deployment script..."

# 1. Stop the logserver service if exists
if systemctl list-units --type=service | grep -q "logserver"; then
    log "Stopping logserver service..."
    sudo systemctl stop logserver
else
    log "logserver service not running, skipping stop."
fi

# 2. Check if logserver.zip exists
if [ -f "/data/opt/logserver.zip" ]; then
    log "Found logserver.zip in /data/opt."
else
    log "logserver.zip not found! Exiting."
    exit 1
fi

# 3. Backup kibana.yml and env.config.js
BACKUP_DIR="/data/opt/bck"
mkdir -p "$BACKUP_DIR"
if [ -f "/data/opt/logserver/config/kibana.yml" ] && [ -f "/data/opt/logserver/config/env.config.js" ]; then
    cp /data/opt/logserver/config/kibana.yml "$BACKUP_DIR/"
    cp /data/opt/logserver/config/env.config.js "$BACKUP_DIR/"
    log "Backed up kibana.yml and env.config.js to $BACKUP_DIR."
else
    log "kibana.yml or env.config.js not found, skipping backup."
fi

# 4. Ask user if full logserver backup is needed
read -p "Do you want to backup the entire logserver folder? (y/n): " backup_choice

if [[ "$backup_choice" == "y" ]]; then
    if [ -d "/data/opt/logserver" ]; then
        mv /data/opt/logserver "$BACKUP_DIR/"
        log "Moved logserver directory to $BACKUP_DIR."
    else
        log "logserver directory not found."
    fi
elif [[ "$backup_choice" == "n" ]]; then
    if [ -d "/data/opt/logserver" ]; then
        rm -rf /data/opt/logserver
        log "Deleted logserver directory."
    else
        log "logserver directory not found for deletion."
    fi
else
    log "Invalid input. Please answer y or n."
    exit 1
fi

# 5. Unzip logserver.zip
unzip /data/opt/logserver.zip -d /data/opt/
log "Unzipped logserver.zip to /data/opt/."

# 6. Restore kibana.yml and env.config.js
cp "$BACKUP_DIR/kibana.yml" /data/opt/logserver/config/
cp "$BACKUP_DIR/env.config.js" /data/opt/logserver/config/
log "Restored kibana.yml and env.config.js to /data/opt/logserver/config/."

# 7. Give executable permission to kibana.yml
chmod +x /data/opt/logserver/config/kibana.yml
log "Given executable permission to kibana.yml."

# 8. Ask user for each IP and replace in files (with example prompts)
read -p "Enter IP for INFRAON_API (example: 10.0.4.110): " infraon_api_ip
sed -i "s|INFRAON_API_URL|https://$infraon_api_ip|g" $(grep -rl "INFRAON_API_URL" /data/opt/logserver)
log "Replaced INFRAON_API_URL with https://$infraon_api_ip."

read -p "Enter IP for INFRAON_REDIRECT_URL (example: 10.0.4.110): " infraon_redirect_ip
sed -i "s|INFRAON_REDIRECT_URL|https://$infraon_redirect_ip/|g" $(grep -rl "INFRAON_REDIRECT_URL" /data/opt/logserver)
log "Replaced INFRAON_REDIRECT_URL with https://$infraon_redirect_ip/."

read -p "Enter IP:Port for INFRAON_KAFKA_URL (example: 10.0.4.203:9092): " kafka_ip_port
sed -i "s|INFRAON_KAFKA_URL|$kafka_ip_port|g" $(grep -rl "INFRAON_KAFKA_URL" /data/opt/logserver)
log "Replaced INFRAON_KAFKA_URL with $kafka_ip_port."

# 9. Set chmod 777 permissions for all files in /data/opt/logserver/bin before starting service
log "Setting chmod 777 permissions to all files in /data/opt/logserver/bin..."
chmod -R 777 /data/opt/logserver/bin/
log "Set chmod 777 permissions."

# 10. Restart and show status of logserver
log "Restarting logserver service..."
sudo systemctl restart logserver

log "Checking logserver service status..."
sudo systemctl status logserver | tee -a "$LOGFILE"

# 11. Ask user to delete logserver.zip
read -p "Do you want to delete the logserver.zip file from /data/opt? (y/n): " delete_zip_choice

if [[ "$delete_zip_choice" == "y" ]]; then
    rm -f /data/opt/logserver.zip
    log "Deleted logserver.zip from /data/opt."
elif [[ "$delete_zip_choice" == "n" ]]; then
    log "Kept logserver.zip in /data/opt."
else
    log "Invalid input. Skipping zip file deletion."
fi

log "Deployment script completed successfully."

