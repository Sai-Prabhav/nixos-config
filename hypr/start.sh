o#!/usr/bin/env bash

swww-daemon &
swww img -o "eDP-1" ~/nixos-config/hypr/background2.png
swww img -o "HDMI-A-1" ~/nixos-config/hypr/background2.png
nm-applet --intecator &
waybar -c ~/nixos-config/waybar/config  -s ~/nixos-config/waybar/style.css &
mako &
