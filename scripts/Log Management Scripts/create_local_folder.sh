#!/bin/bash
# setup_logs.sh
# Usage: ./setup_logs.sh /path/to/folder [user] [group]

FOLDER=$1
INDEX_NAME=$2
USER=${3:-logstash}
GROUP=${4:-logstash}

if [ -z "$FOLDER" ]; then
  echo "❌ Folder path required"
  exit 1
fi

# Create folder
mkdir -p "$FOLDER"

# Create INDEX FOLDER
mkdir -p "$FOLDER/$INDEX_NAME"


# Set permissions
chmod 777 "$FOLDER"
chmod 777 "$FOLDER/$INDEX_NAME"

# Set ownership
chown "$USER":"$GROUP" "$FOLDER"
chown "$USER":"$GROUP" "$FOLDER/$INDEX_NAME"

echo "✅ Folder $FOLDER created with owner $USER:$GROUP and permissions 750"

