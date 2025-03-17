#!/bin/sh

# Options with icons (requires Font Awesome)
shutdown="⏻ Shutdown"
reboot="🗘 Reboot"
logout="↩ Logout"
suspend="󰒲 Suspend"
lock="🔒 Lock"

# Get answer from wofi
selected_option=$(echo -e "$shutdown\n$reboot\n$logout\n$suspend\n$lock" | wofi --dmenu --prompt "Power Menu")

# Do something based on selected option
case $selected_option in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$lock")
        swaylock
        ;;
esac