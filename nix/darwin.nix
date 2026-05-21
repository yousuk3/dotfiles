{ config, pkgs, user, hostname, ... }:

{
  system.stateVersion = 6;

  system.primaryUser = user;

  users.users.${user}.home = "/Users/${user}";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [
    "@admin"
    user
  ];

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  homebrew = {
    enable = true;
    user = user;

    onActivation = {
      autoUpdate = false;
      upgrade = false;

      # 最初は "none" 推奨。
      # 慣れたら "check"、完全管理にしたら "uninstall" も検討。
      cleanup = "none";
    };

    brews = [
      "mas"
    ];

    casks = [
      "alt-tab"
      "appcleaner"
      "brave-browser"
      "firefox"
      "google-japanese-ime"
      "karabiner-elements"
      "microsoft-edge"
      "microsoft-excel"
      "microsoft-onenote"
      "microsoft-outlook"
      "microsoft-powerpoint"
      "microsoft-word"
      "raycast"
      "visual-studio-code"
    ];

    masApps = {
      "RunCat" = 1429033973;
    };
  };
}