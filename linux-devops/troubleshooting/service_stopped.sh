#!/bin/bash
# Simulate service stopped
sudo systemctl stop nginx
echo "Service status:"
systemctl status nginx

