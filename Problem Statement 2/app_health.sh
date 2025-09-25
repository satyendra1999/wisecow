#!/bin/bash

APP_URL="http://localhost:4499"
LOGFILE="app_health.log"

echo "=== Application Health Check: $(date) ===" >> $LOGFILE

STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" $APP_URL)

if [ "$STATUS_CODE" -eq 200 ]; then
  echo "✅ Application is UP (Status Code: $STATUS_CODE)" | tee -a $LOGFILE
else
  echo "❌ Application is DOWN (Status Code: $STATUS_CODE)" | tee -a $LOGFILE
fi

echo "=== Health Check Completed ===" >> $LOGFILE
