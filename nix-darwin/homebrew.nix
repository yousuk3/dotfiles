{ user, ... }:

{
  homebrew = {
    enable = true;
    user = user;

    onActivation = {
      autoUpdate = false;
      upgrade = false;

      # 移行初期は none が安全。
      # 完全にnix-darwin管理へ寄せたら check → uninstall を検討。
      cleanup = "none";
    };

    brews = [
      "mas"
    ];

    casks = [
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
      "obsidian"
      "raycast"
      "stremio"
      "visual-studio-code"
    ];

    masApps = {
      "RunCat" = 1429033973;
    };
  };
}