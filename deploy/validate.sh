#!/bin/bash
# Validate that the service is running
echo "Validating Spring Boot application"
SERVICE_URL="http://localhost:8080/actuator/health"

while true; do
  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $SERVICE_URL)

  if [ "$STATUS_CODE" -ne 200 ]; then
    echo "Service is not running or not healthy"
    sleep 5  # Wait for 5 seconds before checking again
  else
    echo "Service is running and healthy"
    break
  fi
done

