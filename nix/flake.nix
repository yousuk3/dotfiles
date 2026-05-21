{
  description = "yousuk3's macOS configuration with nix-darwin and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    user = "yn";

    mkDarwin = hostname: system:
      nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs user hostname;
        };

        modules = [
          ./darwin.nix

          home-manager.darwinModules.home-manager

          {
            nixpkgs.hostPlatform = system;

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "before-home-manager";
            home-manager.extraSpecialArgs = {
              inherit inputs user hostname;
            };

            home-manager.users.${user} = import ./home.nix;
          }
        ];
      };
  in
  {
    darwinConfigurations = {
      # Intel Mac
      # orion = mkDarwin "orion" "x86_64-darwin";

      # Apple Silicon Mac
      orion = mkDarwin "orion" "aarch64-darwin";
    };
  };
}