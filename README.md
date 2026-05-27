# dotfiles

macOS setup with Nix, nix-darwin, Home Manager, Homebrew casks, and MAS apps.

## Initial macOS settings

Set these manually first:

- Battery charge limit: 80%
- Computer name
  - remove `のコンピューター`
- Disable startup sound
- Mute audio
- Accessibility > Pointer Control > Trackpad Options
  - Enable `Use trackpad for dragging`
  - Dragging style: `Three-Finger Drag`
- Menu Bar
  - Hide Spotlight in the menu bar
- Wallpaper > Screen Saver
  - Start Screen Saver: `Never`
- Mouse
  - Tracking speed: 4th from the fastest
  - Scrolling speed: 2nd from the fastest
  - Advanced > Pointer acceleration: Off
- Finder
  - Disable warning before removing from iCloud Drive
- Defaults
  - Disable boot chime:

```sh
sudo nvram BootPreference=%00
```

  - Disable Feedback Assistant auto-gathering:

```sh
defaults write com.apple.appleseed.FeedbackAssistant Autogather -bool false
```

  - Avoid `.DS_Store` files on network volumes:

```sh
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
```

  - Avoid `.DS_Store` files on USB volumes:

```sh
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

## Xcode Command Line Tools

```sh
xcode-select --install
```

## Rosetta

Apple Silicon only.

```sh
softwareupdate --install-rosetta --agree-to-license
```

## Homebrew

Required for Homebrew casks and MAS apps managed by nix-darwin.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then reboot.

```sh
sudo reboot
```

## Nix

```sh
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
```

Restart the terminal, then check:

```sh
nix --version
```

Optional:

```sh
nix run nixpkgs#hello
```

## Clone dotfiles

```sh
cd ~
git clone https://github.com/yousuk3/dotfiles.git
cd dotfiles
```

## Check before applying

```sh
nix flake check
nix build .#darwinConfigurations.orion.system
```

## App Store

Log in to the App Store before installing MAS apps.

## First nix-darwin switch

```sh
sudo -H nix run github:nix-darwin/nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake .#orion
```

## After installation

```sh
cd ~/dotfiles
sudo darwin-rebuild switch --flake .#orion
```

Or use Makefile:

```sh
make nix-switch
```

## Update

```sh
cd ~/dotfiles
nix flake update
sudo darwin-rebuild switch --flake .#orion
```

Or:

```sh
make nix-update
```

## Add CLI packages

Edit:

```text
nix/modules/home/packages.nix
```

Then run:

```sh
make nix-switch
```

## Add GUI apps

Edit Homebrew casks in:

```text
nix/modules/darwin/homebrew.nix
```

Then run:

```sh
make nix-switch
```

## Add MAS apps

Find the app ID:

```sh
mas search "App Name"
```

Add it to `masApps`, then run:

```sh
make nix-switch
```

## GitHub SSH setup

Create an SSH key:

```sh
ssh-keygen -t ed25519 -C "161000005+yousuk3@users.noreply.github.com"
```

Start ssh-agent:

```sh
eval "$(ssh-agent -s)"
```

Add the key:

```sh
ssh-add ~/.ssh/id_ed25519
```

Copy the public key:

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```

Add it to GitHub:

```text
GitHub
Settings
SSH and GPG keys
New SSH key
```

Test:

```sh
ssh -T git@github.com
```

If port 22 is blocked, use SSH over 443:

```sh
mkdir -p ~/.ssh
cat >> ~/.ssh/config <<'EOF'
Host github.com
  HostName ssh.github.com
  User git
  Port 443
EOF
```

Test again:

```sh
ssh -T git@github.com
```

Change remote URL:

```sh
git remote set-url origin git@github.com:yousuk3/dotfiles.git
```

## Useful commands

```sh
make nix-check
make nix-build
make nix-switch
make nix-update
make nix-gc
```