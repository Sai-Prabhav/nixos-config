#!/usr/bin/env bash

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
    eval $(ssh-agent)
    echo "SSH agent started and key added."
fi


ssh-add ~/nixos-config/.ssh/id_ed25519
git add .
git commit -m "Update $(date '+%Y-%m-%d %H:%M:%S')"
git push --set-upstream origin master
