#!/bin/bash

# 1. Stop firewalld if running
if systemctl is-active --quiet firewalld; then
    echo "Stopping firewalld service..."
    sudo systemctl stop firewalld
else
    echo "firewalld service is not running."
fi

# 2. Start rabbitmq-server if stopped
if ! systemctl is-active --quiet rabbitmq-server; then
    echo "Starting rabbitmq-server service..."
    sudo systemctl start rabbitmq-server
else
    echo "rabbitmq-server service is already running."
fi

# 3. Navigate to the backend API directory
cd /data/opt/instancerepo/Infraon/infraon_backend_api || {
    echo "Failed to change directory to /data/opt/instancerepo/Infraon/infraon_backend_api"
    exit 1
}

# 4. Manage pm2 process for log_proxy_server.js
if ! pm2 describe log_proxy_server.js > /dev/null; then
    echo "Starting pm2 process for log_proxy_server.js..."
    pm2 start log_proxy_server.js
else
    echo "log_proxy_server.js already exists, restarting..."
    pm2 restart log_proxy_server.js
fi

# 5. Manage pm2 process for Infraon backend service (npm start)
if ! pm2 describe "Infraon backend Service" > /dev/null; then
    echo "Starting pm2 process 'Infraon backend Service'..."
    pm2 start npm --name "Infraon backend Service" -- start
else
    echo "Infraon backend Service already exists, restarting..."
    pm2 restart "Infraon backend Service"
fi

cd /opt/EIMS/scripts/linux_scripts/product

echo "All tasks completed successfully."

