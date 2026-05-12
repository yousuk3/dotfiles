.PHONY: help init link defaults brew setup check

help:
	@echo "Available commands:"
	@echo "  make init      Install Rosetta, Xcode Command Line Tools, Homebrew"
	@echo "  make link      Link dotfiles"
	@echo "  make defaults  Apply macOS defaults"
	@echo "  make brew      Install apps with Homebrew Bundle"
	@echo "  make setup     Setup GitHub SSH key"
	@echo "  make check     Check Brewfile"

init:
	@echo "\033[0;34mRun init.sh\033[0m"
	@.bin/init.sh
	@echo "\033[0;32mDone.\033[0m"

link:
	@echo "\033[0;34mRun link.sh\033[0m"
	@.bin/link.sh
	@echo "\033[0;32mDone.\033[0m"

defaults:
	@echo "\033[0;34mRun defaults.sh\033[0m"
	@.bin/defaults.sh
	@echo "\033[0;32mDone. Please reboot system.\033[0m"

brew:
	@echo "\033[0;34mRun brew.sh\033[0m"
	@.bin/brew.sh
	@echo "\033[0;32mDone.\033[0m"

setup:
	@echo "\033[0;34mRun setup.sh\033[0m"
	@.bin/setup.sh
	@echo "\033[0;32mDone.\033[0m"

check:
	@brew bundle check --global
