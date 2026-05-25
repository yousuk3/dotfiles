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
      # Linux
      "*~"
      ".fuse_hidden*"
      ".directory"
      ".Trash-*"
      ".nfs*"

      # macOS
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "Icon"
      "._*"
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"
      "*.icloud"

      # JetBrains / VS Code
      ".idea/"
      ".vscode/"

      # Node logs
      "logs"
      "*.log"
      "npm-debug.log*"
      "yarn-debug.log*"
      "yarn-error.log*"
      "lerna-debug.log*"
      ".pnpm-debug.log*"

      # Diagnostic reports
      "report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json"

      # Runtime data
      "pids"
      "*.pid"
      "*.seed"
      "*.pid.lock"

      # Coverage
      "lib-cov"
      "coverage"
      "*.lcov"
      ".nyc_output"

      # Build / package manager artifacts
      ".grunt"
      "bower_components"
      ".lock-wscript"
      "build/Release"
      "node_modules/"
      "jspm_packages/"
      "web_modules/"
      "*.tsbuildinfo"
      ".npm"
      ".eslintcache"
      ".stylelintcache"
      ".rpt2_cache/"
      ".rts2_cache_cjs/"
      ".rts2_cache_es/"
      ".rts2_cache_umd/"
      ".node_repl_history"
      "*.tgz"
      ".yarn-integrity"

      # Env files
      ".env"
      ".env.development.local"
      ".env.test.local"
      ".env.production.local"
      ".env.local"

      # Frontend frameworks / bundlers
      ".cache"
      ".parcel-cache"
      ".next"
      "out"
      ".nuxt"
      "dist"
      ".vuepress/dist"
      ".temp"
      ".docusaurus"
      ".serverless/"
      ".fusebox/"
      ".dynamodb/"
      ".tern-port"
      ".vscode-test"
      ".webpack/"
      ".svelte-kit"

      # Yarn v2+
      ".yarn/cache"
      ".yarn/unplugged"
      ".yarn/build-state.yml"
      ".yarn/install-state.gz"
      ".pnp.*"
    ];
  };
}
