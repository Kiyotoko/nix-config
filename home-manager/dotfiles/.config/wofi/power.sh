#!/bin/sh

op=$( echo -e "  Poweroff\n  Reboot\n  Suspend\n  Lock\n  Logout" | wofi -i --dmenu --width 300 --height 200 | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    ;&
  reboot)
    ;&
  suspend)
    systemctl $op
    ;;
  lock)
    hyprlock
    ;;
esac