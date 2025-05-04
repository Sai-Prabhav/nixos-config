#!/usr/bin/env bash


if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval $(ssh-agent)
    ssh-add ~/nixos-config/.ssh/id_ed25519       
    echo "SSH agent started and key added."
fi

git add .
git commit -m "Update $(date '+%Y-%m-%d %H:%M:%S')"
git push --set-upstream origin master       