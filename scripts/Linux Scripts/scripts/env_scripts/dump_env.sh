#!/bin/bash

# Exit if any command fails, if any variable is undefined, or in case of pipeline failure
set -euo pipefail

# Timestamped logging function
log() {
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

log "🚀 Starting Infraon Environment Setup"

# Navigate to virtual environment directory
log "📁 Changing directory to /opt/infraonenv/bin"
cd /opt/infraonenv/bin || { log "❌ Failed to change directory to /opt/infraonenv/bin"; exit 1; }

# Activate virtual environment
log "🧪 Activating virtual environment"
source activate

# Navigate to monitoring script directory
log "📁 Changing directory to monitoring path"
cd /data/opt/instancerepo/Infraon/infraon_devops/ || {
    log "❌ Failed to change directory to monitoring path"; exit 1;
}

# Define .env path
ENV_FILE="/data/opt/instancerepo/Infraon/infraon_env/.env"
log "🧾 Running script: load_default_environment.py with env file: $ENV_FILE"

# Run the Python script
python load_default_environment.py "$ENV_FILE"

log "✅ Infraon Environment Setup Completed Successfully"

