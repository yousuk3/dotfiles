#!/bin/zsh

echo "\033[0;34m- GitHub SSH Setup...\033[0m"

SSH_KEY_PATH="$HOME/.ssh"
mkdir -p "$SSH_KEY_PATH"
chmod 700 "$SSH_KEY_PATH"

ssh-keygen -t ed25519 -C "161000005+yousuk3@users.noreply.github.com" -f "${SSH_KEY_PATH}/id_ed25519"

eval "$(ssh-agent -s)"
ssh-add "${SSH_KEY_PATH}/id_ed25519"

pbcopy < "${SSH_KEY_PATH}/id_ed25519.pub"

echo "SSH public key copied to clipboard. Paste it into GitHub."
open https://github.com/settings/ssh/new
