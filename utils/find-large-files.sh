#!/usr/bin/env bash
# List the top 20 largest files under a given directory (default: home)
DIR="${1:-$HOME}"
find "$DIR" -type f -not -path '*/.git/*' -exec du -sh {} + 2>/dev/null \
  | sort -rh | head -20
