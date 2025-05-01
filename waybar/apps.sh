#!/usr/bin/env bash

# Get open windows from Hyprland
windows=$(hyprctl clients -j)

# Function to get Unicode icons
get_icon() {
    local class="$1"
    case "$class" in
        "Brave-browser") echo "" ;;  # Brave icon
        "discord") echo "" ;;        # Discord icon
        "Code") echo "" ;;           # VS Code icon
        "kitty") echo "" ;;          # Terminal icon
        "firefox") echo "" ;;        # Firefox
        "thunderbird") echo "" ;;    # Mail
        "spotify") echo "" ;;        # Spotify
        "steam") echo "" ;;          # Steam
        *) echo "" ;;                # Default window icon
    esac
}

# Process windows
output=""
while IFS= read -r window; do
    class=$(echo "$window" | jq -r '.class')
    title=$(echo "$window" | jq -r '.title')
    address=$(echo "$window" | jq -r '.address')
    icon=$(get_icon "$class")

    output+="{\"text\":\"$icon\", \"tooltip\":\"$title\", \"class\":\"$class\", \"address\":\"$address\"},"
done <<< "$(echo "$windows" | jq -c '.[]')"

# Final JSON
output="${output%,}"
echo "{\"text\":\"\", \"tooltip\":\"Open Applications\", \"class\":\"open-apps\", \"children\":[$output]}"