#!/bin/bash
echo "Backing up scripts folder..."
tar -czf backup.tar.gz ~/linux-devops/scripts
echo "Backup saved as backup.tar.gz"
