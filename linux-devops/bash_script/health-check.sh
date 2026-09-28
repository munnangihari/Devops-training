#!/bin/bash
echo "Health Check:"
uptime        # CPU load
free -h       # Memory
df -h         # Disk
systemctl is-active nginx
