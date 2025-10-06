#!/bin/bash

# Find and kill all Elasticsearch processes

echo "Searching for Elasticsearch processes..."

PIDS=$(ps -ef | grep elasticsearch | grep -v grep | awk '{print $2}')

if [ -z "$PIDS" ]; then
    echo "No Elasticsearch processes found."
else
    echo "Killing Elasticsearch processes: $PIDS"
    for PID in $PIDS; do
        kill -9 $PID
        echo "Killed PID $PID"
    done
fi

