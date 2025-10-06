#!/bin/bash

###############################################################################
# Delete Elasticsearch indices older than N days.
# • Works with HTTP or HTTPS.
# • Uses /opt/certs/http_ca.crt automatically for HTTPS.
# • Prompts have sensible defaults (HTTP, 0.0.0.0 IP, elastic user).
###############################################################################

# 1) Protocol
read -p "Enter protocol (http or https, default is http): " protocol
protocol=${protocol:-http}

# 2) Host/IP
read -p "Enter Elasticsearch IP address (default is 0.0.0.0): " es_ip
es_ip=${es_ip:-0.0.0.0}

# 3) Credentials
read -p "Enter Elasticsearch username (default is 'elastic'): " es_user
es_user=${es_user:-elastic}

read -s -p "Enter Elasticsearch password: " es_password
echo

# 4) Retention window
read -p "Enter number of days to keep indices (e.g., 9): " num_days

# --------------------------------------------------------------------------- #
date_threshold=$(date --date="$num_days days ago" +'%Y.%m.%d')
cert_path="/opt/certs/http_ca.crt"

# Build common curl options
if [[ "$protocol" == "https" ]]; then
  CURL_PREFIX=(curl --cacert "$cert_path" -u "$es_user:$es_password")
else
  CURL_PREFIX=(curl -u "$es_user:$es_password")
fi

# --------------------------------------------------------------------------- #
# Fetch indices, filter by date, delete older ones
for index in $("${CURL_PREFIX[@]}" -s -X GET \
                "$protocol://$es_ip:9200/_cat/indices?h=index" |
              grep -E '[0-9]{4}\.[0-9]{2}\.[0-9]{2}' |
              awk -v date="$date_threshold" -F'-' '{ if ($NF < date) print $0 }'); do
  echo "Deleting index: $index"
  "${CURL_PREFIX[@]}" -X DELETE "$protocol://$es_ip:9200/$index"
done

