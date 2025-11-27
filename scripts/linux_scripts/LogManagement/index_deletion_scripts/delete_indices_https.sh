#!/bin/bash

###############################################################################
# Delete Elasticsearch indices older than N days.
# • Accepts command line arguments (protocol, es_ip, es_user, es_password, num_days).
# • Prompts interactively for any missing arguments.
# • Skips deletion of system indices (those starting with a dot).
# • Uses /opt/certs/http_ca.crt automatically for HTTPS.
###############################################################################

# Usage: ./script.sh [protocol] [es_ip] [es_user] [es_password] [num_days]

# Assign arguments or prompt fallback
protocol="${1:-}"
es_ip="${2:-}"
es_user="${3:-}"
es_password="${4:-}"
num_days="${5:-}"

# Protocol
if [[ -z "$protocol" ]]; then
  read -p "Enter protocol (http or https, default is http): " protocol
  protocol=${protocol:-http}
fi

# Elasticsearch IP/Host
if [[ -z "$es_ip" ]]; then
  read -p "Enter Elasticsearch IP address (default is 0.0.0.0): " es_ip
  es_ip=${es_ip:-0.0.0.0}
fi

# Username
if [[ -z "$es_user" ]]; then
  read -p "Enter Elasticsearch username (default is 'elastic'): " es_user
  es_user=${es_user:-elastic}
fi

# Password (prompt always if missing)
if [[ -z "$es_password" ]]; then
  read -s -p "Enter Elasticsearch password: " es_password
  echo
fi

# Retention window
if [[ -z "$num_days" ]]; then
  read -p "Enter number of days to keep indices (e.g., 9): " num_days
fi

date_threshold=$(date --date="$num_days days ago" +'%Y.%m.%d')
cert_path="/opt/certs/http_ca.crt"

# Build curl options
if [[ "$protocol" == "https" ]]; then
  CURL_PREFIX=(curl --cacert "$cert_path" -u "$es_user:$es_password")
else
  CURL_PREFIX=(curl -u "$es_user:$es_password")
fi

# Main loop: fetch indices, filter out system indices, then delete as needed
for index in $("${CURL_PREFIX[@]}" -s -X GET \
                "$protocol://$es_ip:9200/_cat/indices?h=index" |
              grep -E '[0-9]{4}\.[0-9]{2}\.[0-9]{2}' |
              awk -v date="$date_threshold" -F'-' '{ if ($NF < date) print $0 }'); do
  # Skip system indices (those starting with a dot)
  if [[ $index == .* ]]; then
    continue
  fi
  echo "Deleting index: $index"
  "${CURL_PREFIX[@]}" -X DELETE "$protocol://$es_ip:9200/$index"
done

