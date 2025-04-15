#!/bin/env bash

op=$( echo -e "  Poweroff\n  Reboot\n  Suspend\n  Lock" | wofi -i -d -H 300 | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    ;&
  reboot)
    ;&
  suspend)
    systemctl "$op"
    ;;
  lock)
    hyprlock
    ;;
esac