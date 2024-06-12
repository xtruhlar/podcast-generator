#!/bin/bash

echo "================================="

# config new machine
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# run py file
python3 /usr/bin/feed.py

# push changes
git add -A && git commit -m "Update Feed" 
git push --set-upstream origin main

echo "================================="