#!/bin/bash

hyprctl dispatch exec discord-canary
sleep 2s
hyprctl dispatch movetoworkspacesilent 4,discord-canary
sleep 4s
hyprctl dispatch movetoworkspacesilent 4,discord-canary
