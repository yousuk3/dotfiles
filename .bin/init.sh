#!/bin/zsh

# Check operating system
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# Install Rosetta 2 for Apple Silicon
if [ "$(uname -m)" = "arm64" ] ; then
  /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

# Xcode Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Homebrew PATH
if [ "$(uname -m)" = "arm64" ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)" > /dev/null
elif [ "$(uname -m)" = "x86_64" ] ; then
  eval "$(/usr/local/bin/brew shellenv)" > /dev/null
fi
