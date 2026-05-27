{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    # direnv  -> programs.direnv.enable
    eza
    exiftool
    fastfetch
    fd
    # fzf     -> programs.fzf.enable
    gh
    # git     -> programs.git.enable
    jq
    p7zip
    ripgrep
    tree
    # vim     -> programs.vim.enable
    # zoxide  -> programs.zoxide.enable
    # zsh     -> programs.zsh.enable
  ];

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}