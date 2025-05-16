#!/usr/bin/env bash

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percentage=$((brightness * 100 / max_brightness))
echo "B $percentage%"