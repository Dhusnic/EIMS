#!/bin/bash
ps aux | grep 'logstash' | grep -v grep | awk '{print $2}' | xargs kill -9
sudo systemctl start logstash
