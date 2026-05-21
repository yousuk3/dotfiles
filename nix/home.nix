{ config, pkgs, user, ... }:

{
  home.username = user;
  home.homeDirectory = "/Users/${user}";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

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

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "yousuk3";
        email = "161000005+yousuk3@users.noreply.github.com";
      };

      core = {
        editor = "vim";
        excludesfile = "~/.gitignore_global";
      };

      init = {
        defaultBranch = "main";
      };

      fetch = {
        prune = true;
      };

      alias = {
        st = "status";
        sw = "switch";
        co = "checkout";
        br = "branch";
        cm = "commit";
        lg = "log --oneline --graph --decorate";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    history = {
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 100000;
      save = 100000;
      ignoreDups = true;
      share = true;
    };

    shellAliases = {
      ll = "ls -lF";
      la = "ls -lAF";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      relogin = "exec $SHELL -l";
      delds = "find . -name '.DS_Store' -type f -ls -delete";

      g = "git";
      gb = "git branch";
      gs = "git status";
      gf = "git fetch";
    };

    initContent = ''
      if command -v fastfetch >/dev/null 2>&1; then
        fastfetch
      fi
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.file.".gitignore_global".text = ''
    .DS_Store
    .AppleDouble
    .LSOverride

    .idea/
    .vscode/
  '';
}