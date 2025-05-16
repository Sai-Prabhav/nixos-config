o#!/usr/bin/env bash

swww-daemon &
swww img ~/nixos-config/hypr/background.jpg
nm-applet --intecator &
waybar -c ~/nixos-config/waybar/config  -s ~/nixos-config/waybar/style.css &
mako &