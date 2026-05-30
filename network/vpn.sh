#!/usr/bin/env bash
# Control GlobalProtect VPN via launchctl
GP_PLIST="/Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"

case "$1" in
  start)
    launchctl load $GP_PLIST && echo "GlobalProtect started."
    ;;
  stop)
    launchctl unload $GP_PLIST && echo "GlobalProtect stopped."
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac
