{ pkgs, user, system, ... }:

{
  nixpkgs.hostPlatform = system;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [
    "@admin"
    user
  ];

  system.primaryUser = user;

  users.users.${user}.home = "/Users/${user}";

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  system.stateVersion = 6;
}