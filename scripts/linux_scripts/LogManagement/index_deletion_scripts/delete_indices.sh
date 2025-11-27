#!/bin/bash

# Prompt for Elasticsearch IP address
read -p "Enter Elasticsearch IP address: " es_ip

# Prompt for Elasticsearch username (assuming 'elastic' as default)
read -p "Enter Elasticsearch username (default is 'elastic'): " es_user
es_user=${es_user:-elastic}

# Prompt for Elasticsearch password
read -s -p "Enter Elasticsearch password: " es_password
echo

# Prompt for number of days to delete indices older than
read -p "Enter number of days to keep indices (e.g., 9): " num_days

# Calculate date threshold
date_threshold=$(date --date="$num_days days ago" +%Y.%m.%d)

# Execute the deletion command
for index in $(curl -s -u "$es_user:$es_password" -X GET "http://$es_ip:9200/_cat/indices?h=index" | grep -E '[0-9]{4}\.[0-9]{2}\.[0-9]{2}' | awk -v date="$date_threshold" -F'-' '{if ($NF < date) print $0}'); do
  echo "Deleting index: $index"
  curl -u "$es_user:$es_password" -X DELETE "http://$es_ip:9200/$index"
done

