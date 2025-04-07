#!/bin/sh
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#
# -----------------------------------------------------
# Quit all running waybar instances
# -----------------------------------------------------
killall waybar
pkill waybar
sleep 0.5

# -----------------------------------------------------
# Loading the configuration
# -----------------------------------------------------
config_file="config.jsonc"
style_file="style.css"

waybar -c ~/.config/waybar/themes/ml4w-minimal/$config_file -s ~/.config/waybar/themes/ml4w-minimal/$style_file &
