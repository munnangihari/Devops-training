#!/bin/bash
# Simulate disk full
fallocate -l 100M bigfile
echo "Disk usage:"
df -h
du -sh .

