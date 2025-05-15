#!/bin/bash

current_workspace=$(hyprctl -j clients | jq -r '.[] | select(.class=="discord") | .workspace.name')

hyprctl dispatch exec [workspace 4 silent] uwsm app -- discord

while [ "$current_workspace" != "4" ]; do
  current_workspace=$(hyprctl -j clients | jq -r '.[] | select(.class=="discord") | .workspace.name')
  hyprctl dispatch movetoworkspacesilent 4,class:discord
  echo $current_workspace
done
