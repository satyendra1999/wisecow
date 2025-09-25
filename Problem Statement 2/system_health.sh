#!/bin/bash

# Threshold values
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

LOGFILE="system_health.log"

echo "=== System Health Check: $(date) ===" >> $LOGFILE

# CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_INT=${CPU%.*}

if [ $CPU_INT -gt $CPU_THRESHOLD ]; then
  echo "⚠️ High CPU usage: $CPU%" | tee -a $LOGFILE
else
  echo "✅ CPU usage normal: $CPU%" >> $LOGFILE
fi

# Memory usage
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
MEM_INT=${MEM%.*}

if [ $MEM_INT -gt $MEM_THRESHOLD ]; then
  echo "⚠️ High Memory usage: $MEM%" | tee -a $LOGFILE
else
  echo "✅ Memory usage normal: $MEM%" >> $LOGFILE
fi

# Disk usage
DISK=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')

if [ $DISK -gt $DISK_THRESHOLD ]; then
  echo "⚠️ High Disk usage: $DISK%" | tee -a $LOGFILE
else
  echo "✅ Disk usage normal: $DISK%" >> $LOGFILE
fi

echo "=== Health Check Completed ===" >> $LOGFILE
