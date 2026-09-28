#!/bin/bash
# Simulate high CPU usage
yes > /dev/null &
echo "Top CPU processes:"
top -b -n 1 | head -n 10

