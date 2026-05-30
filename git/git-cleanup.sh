#!/usr/bin/env bash
# Delete all local branches already merged into main/master
git fetch --prune
git branch --merged | grep -vE '^\*|main|master|develop' | xargs -r git branch -d
echo "Merged branches cleaned up."
