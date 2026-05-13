#!/bin/zsh
set -e

echo "\033[0;34m- GitHub SSH Setup...\033[0m"

SSH_DIR="$HOME/.ssh"
KEY_PATH="$SSH_DIR/id_ed25519"
GITHUB_EMAIL="161000005+yousuk3@users.noreply.github.com"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [ ! -f "$KEY_PATH" ]; then
  ssh-keygen -t ed25519 -C "$GITHUB_EMAIL" -f "$KEY_PATH"
else
  echo "SSH key already exists: $KEY_PATH"
fi

touch "$SSH_DIR/config"
chmod 600 "$SSH_DIR/config"

if ! grep -q "Host github.com" "$SSH_DIR/config"; then
  cat >> "$SSH_DIR/config" <<'EOF'

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOF
fi

eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain "$KEY_PATH"

pbcopy < "${KEY_PATH}.pub"
echo "SSH public key copied to clipboard. Paste it into GitHub."
open https://github.com/settings/ssh/new
