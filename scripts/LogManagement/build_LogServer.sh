#!/bin/bash

set -e
set -o pipefail

# Helper function to print logs with timestamp
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log "-----------------------------------------------"
log "Step 1: Navigating to /data/opt/LogServer/config"
cd /data/opt/LogServer/config
log "Current directory: $(pwd)"
log "-----------------------------------------------"

log "Step 2: Taking backup of existing env.config.js"
cp env.config.js env.config.js.bak
log "Backup created as env.config.js.bak"
log "-----------------------------------------------"

log "Step 3: Checking if /opt/static_files/build.env.config.js exists"

if [ -f /opt/static_files/build.env.config.js ]; then
    log "Found build.env.config.js, copying to current directory as env.config.js"
    cp /opt/static_files/build.env.config.js env.config.js
else
    log "build.env.config.js not found! Creating a new env.config.js with default content."
    cat > env.config.js <<EOL
module.exports = {
    api_url: "INFRAON_API_URL",
    redirect_url: "INFRAON_REDIRECT_URL",
    topic: "log_alerts",
    kafka_access_key: "infraon-producer",
    kafka_secret_key: "infraon@123",
    kafka_brokers: ['INFRAON_KAFKA_BROKER'],
    mechanism: 'scram-sha-512',
    ca_cert: "/opt/environments/ca-cert",
}
EOL
    log "Default env.config.js created successfully."
fi
log "-----------------------------------------------"

log "Step 4: Navigating back to /data/opt/LogServer"
cd /data/opt/LogServer
log "Current directory: $(pwd)"
log "-----------------------------------------------"

log "Step 5: Running build command: node scripts/build --rpm"
node scripts/build --rpm
log "Build process completed successfully"
log "-----------------------------------------------"

log "Step 6: Restoring original env.config.js"
cd /data/opt/LogServer/config
mv env.config.js.bak env.config.js
log "Original env.config.js restored"
log "-----------------------------------------------"

log "Step 7: Navigating to build/default directory"
cd /data/opt/LogServer/build/default
log "Current directory: $(pwd)"
log "-----------------------------------------------"

log "Step 8: Renaming kibana-8.14.0-SNAPSHOT-linux-x86_64 to logserver-8.14.0"
mv kibana-8.14.0-SNAPSHOT-linux-x86_64 logserver-8.14.0
log "Renaming successful"
log "-----------------------------------------------"

log "Step 9: Zipping logserver-8.14.0 into logserver-8.14.0.zip"
zip -r logserver-8.14.0.zip logserver-8.14.0
log "Zipping completed successfully"
log "-----------------------------------------------"

log "Step 10: Moving logserver-8.14.0.zip to /opt directory"
mv logserver-8.14.0.zip /opt/
log "File moved successfully to /opt"
log "-----------------------------------------------"

log "✅✅✅ All steps completed successfully!"

