{ user, ... }:

let
  homeDir = "/Users/${user}";
in
{
  # Enable the macOS application firewall.
  networking.applicationFirewall = {
    enable = true;
  };

  system.defaults = {
    # -------------------------------------------------------------------------
    # Global macOS preferences
    # -------------------------------------------------------------------------
    NSGlobalDomain = {
      # Show all filename extensions in Finder and file dialogs.
      AppleShowAllExtensions = true;

      # Always show scroll bars.
      AppleShowScrollBars = "Always";

      # Jump to the clicked spot when clicking in the scroll bar.
      AppleScrollerPagingBehavior = true;

      # Set sidebar icon size to small.
      NSTableViewDefaultSizeMode = 1;

      # Set key repeat speed to fast.
      KeyRepeat = 2;

      # Set delay until key repeat to short.
      InitialKeyRepeat = 15;

      # Enable full keyboard access for controls.
      AppleKeyboardUIMode = 2;

      # Use F1, F2, etc. keys as standard function keys.
      "com.apple.keyboard.fnState" = true;

      # Disable automatic spelling correction.
      NSAutomaticSpellingCorrectionEnabled = false;

      # Disable automatic capitalization.
      NSAutomaticCapitalizationEnabled = false;

      # Disable period substitution when pressing space twice.
      NSAutomaticPeriodSubstitutionEnabled = false;

      # Enable feedback sound when changing volume.
      "com.apple.sound.beep.feedback" = 1;

      # Disable natural scrolling.
      "com.apple.swipescrolldirection" = false;

      # Set trackpad tracking speed.
      "com.apple.trackpad.scaling" = 3.0;
    };

    # -------------------------------------------------------------------------
    # Control Center and menu bar
    # -------------------------------------------------------------------------
    controlcenter = {
      # Show Bluetooth in the menu bar.
      Bluetooth = true;

      # Show Sound in the menu bar.
      Sound = true;

      # Show battery percentage in the menu bar.
      BatteryShowPercentage = true;
    };

    # -------------------------------------------------------------------------
    # Dock, Mission Control, and hot corners
    # -------------------------------------------------------------------------
    dock = {
      # Use scale effect when minimizing windows.
      mineffect = "scale";

      # Minimize windows into the application icon.
      "minimize-to-application" = true;

      # Automatically hide and show the Dock.
      autohide = true;

      # Set Dock auto-hide animation duration.
      "autohide-time-modifier" = 0.4;

      # Remove delay before showing the hidden Dock.
      "autohide-delay" = 0.0;

      # Do not show recent applications in the Dock.
      "show-recents" = false;

      # Do not automatically rearrange Spaces based on most recent use.
      "mru-spaces" = false;

      # Set bottom-left hot corner to Desktop.
      # 4 = Desktop
      "wvous-bl-corner" = 4;

      # Set top-right hot corner to Put Display to Sleep.
      # 10 = Put Display to Sleep
      "wvous-tr-corner" = 10;

      # Set bottom-right hot corner to Quick Note.
      # 14 = Quick Note
      "wvous-br-corner" = 14;
    };

    # -------------------------------------------------------------------------
    # Desktop and Stage Manager
    # -------------------------------------------------------------------------
    WindowManager = {
      # Only show Desktop on wallpaper click when using Stage Manager.
      EnableStandardClickToShowDesktop = false;
    };

    # -------------------------------------------------------------------------
    # Finder
    # -------------------------------------------------------------------------
    finder = {
      # Open new Finder windows to the home folder.
      NewWindowTarget = "Home";

      # Disable warning before changing a file extension.
      FXEnableExtensionChangeWarning = false;

      # Search the current folder by default.
      FXDefaultSearchScope = "SCcf";

      # Use list view by default.
      FXPreferredViewStyle = "Nlsv";

      # Show the path bar.
      ShowPathbar = true;

      # Show the status bar.
      ShowStatusBar = true;

      # Show hidden files in Finder.
      AppleShowAllFiles = true;
    };

    # -------------------------------------------------------------------------
    # Screenshot
    # -------------------------------------------------------------------------
    screencapture = {
      # Save screenshots to ~/Pictures/Screenshots.
      location = "${homeDir}/Pictures/Screenshots";

      # Save screenshots as files.
      target = "file";

      # Save screenshots as JPEG.
      type = "jpg";

      # Disable floating thumbnail after taking a screenshot.
      "show-thumbnail" = false;

      # Disable window shadow in screenshots.
      "disable-shadow" = true;
    };
  };

  # ---------------------------------------------------------------------------
  # Extra activation commands for settings not cleanly represented by nix-darwin
  # ---------------------------------------------------------------------------
  system.activationScripts.extraActivation.text = ''
    # Create the screenshot directory if it does not exist.
    /bin/mkdir -p "${homeDir}/Pictures/Screenshots"
    /usr/sbin/chown ${user}:staff "${homeDir}/Pictures/Screenshots" || true
  '';
}