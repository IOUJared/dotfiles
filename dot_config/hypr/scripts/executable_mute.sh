#!/bin/bash

current_workspace=$(hyprctl -j activeworkspace | jq '.id')

discord_active=$(hyprctl monitors -j | jq '.[0].activeWorkspace.id')
discord_active2=$(hyprctl monitors -j | jq '.[1].activeWorkspace.id')

if [ "$discord_active" == "4" ] || [ "$discord_active2" == "4" ]; then
  hyprctl dispatch focuswindow class:legcord
  hyprctl dispatch sendshortcut CONTROL SHIFT, M, class:legcord
  hyprctl dispatch focusmonitor -1
  exit
fi

if [ "$current_workspace" == "4" ]; then
  hyprctl dispatch focuswindow class:legcord
  hyprctl dispatch sendshortcut CONTROL SHIFT, M, class:legcord
  hyprctl dispatch cyclenext prev
else
  hyprctl dispatch moveworkspacetomonitor 4 current
  hyprctl dispatch focuswindow class:legcord
  hyprctl dispatch sendshortcut CONTROL SHIFT, M, class:legcord
  hyprctl dispatch workspace previous
fi
