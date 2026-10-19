#!/bin/bash
# Simulate port unavailable
python3 -m http.server 8080 &
echo "Port check:"
ss -tuln | grep 8080

