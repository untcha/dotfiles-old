#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `config_macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Screen                                                                      #
###############################################################################

#scutil --get LocalHostName

resolution="1680x1050"
echo "$resolution"

# Get the persistent screen id
persistent_screen_id=$(displayplacer list | grep 'Persistent screen id:' | awk '{print $4}')
echo "$persistent_screen_id"

# Get color depth value
color_depth=$(displayplacer list | grep 'Color Depth:' | awk '{print $3}')
echo "$color_depth"

# Set screen resolution with displayplacer
displayplacer "id:$persistent_screen_id res:$resolution color_depth:$color_depth scaling:on origin:(0,0) degree:0"
