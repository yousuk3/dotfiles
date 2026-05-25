{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "yousuk3";
        email = "161000005+yousuk3@users.noreply.github.com";
      };

      core = {
        editor = "vim";
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

    ignores = [
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"

      ".idea/"
      ".vscode/"
    ];
  };
}