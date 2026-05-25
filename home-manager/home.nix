{ config, pkgs, user, ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./zsh.nix
  ];

  home.username = user;
  home.homeDirectory = "/Users/${user}";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}