.PHONY: nix-check nix-build nix-switch nix-update nix-gc

nix-check:
	nix flake check

nix-build:
	nix build .#darwinConfigurations.orion.system

nix-switch:
	sudo darwin-rebuild switch --flake .#orion

nix-update:
	nix flake update
	sudo darwin-rebuild switch --flake .#orion

nix-gc:
	nix-collect-garbage -d