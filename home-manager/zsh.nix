{ config, ... }:

{
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
}