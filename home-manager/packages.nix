{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    eza
    fastfetch
    fd
    fzf
    gh
    git
    jq
    p7zip
    ripgrep
    tree
    zoxide
  ];

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}