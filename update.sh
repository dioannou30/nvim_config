#!/bin/bash

echo "Performing git operations"
git add .
# Get the current date and time for the commit message
DATETIME=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "Config Updates: $DATETIME"
git push origin master