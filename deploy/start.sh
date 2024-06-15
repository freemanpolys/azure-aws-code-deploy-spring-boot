#!/bin/bash
# Start the Spring Boot application using systemd
echo "Starting Spring Boot application"
systemctl restart server
systemctl enable server
