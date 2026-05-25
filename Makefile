HOST ?= orion

.PHONY: nix-check nix-build nix-switch nix-update nix-gc setup github-ssh

nix-check:
	nix flake check

nix-build:
	nix build .#darwinConfigurations.$(HOST).system

nix-switch:
	sudo darwin-rebuild switch --flake .#$(HOST)

nix-update:
	nix flake update
	sudo darwin-rebuild switch --flake .#$(HOST)

nix-gc:
	nix-collect-garbage -d

setup: github-ssh

github-ssh:
	./scripts/github-ssh.sh