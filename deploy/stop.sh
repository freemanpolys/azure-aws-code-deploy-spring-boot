#!/bin/bash
# Stop the Spring Boot application
echo "Stopping Spring Boot application"
if systemctl is-active --quiet server; then
  systemctl stop server
else
  echo "server.service is not running"
fi
