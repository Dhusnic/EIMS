#!/bin/bash

# === Paths ===
REPO_DIR="/data/opt/instancerepo/Infraon"
PASS_FILE="/opt/password.txt"

# === Extract password ===
GIT_PASS=$(grep '^Infraon' "$PASS_FILE" | awk -F '=' '{print $2}' | tr -d ' "')

if [ -z "$GIT_PASS" ]; then
  echo "❌ Infraon password not found in $PASS_FILE"
  exit 1
fi

# === Go to repo and pull ===
cd "$REPO_DIR" || { echo "❌ Repo path not found: $REPO_DIR"; exit 1; }

# === Use expect to handle password prompt ===
expect <<EOF
spawn git pull
expect "Password for 'https://infraon@dev.azure.com':"
send "$GIT_PASS\r"
expect eof
EOF

