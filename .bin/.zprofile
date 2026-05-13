# Set Homebrew
if [ "$(uname -m)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ "$(uname -m)" = "x86_64" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
# .bin/.zprofile に追加
export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/.Brewfile"
