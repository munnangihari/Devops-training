#!/bin/bash
# Simulate permission denied
touch testfile.sh
chmod 000 testfile.sh
echo "Trying to read file:"
cat testfile.sh
ls -l testfile.sh

