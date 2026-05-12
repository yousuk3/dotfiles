# dotfiles

## Overview

This repository contains scripts to set up macOS Tahoe.

## Install

Clone this repository.

```shell
cd ~
git clone https://github.com/yousuk3/dotfiles
cd ~/dotfiles
```

Run setup step by step.

```shell
make init
make link
make defaults
```

Restart macOS.

After restart, sign in to the App Store, then run:

```shell
make brew
make setup
```

## Manual steps

- Sign in to iCloud
- Sign in to App Store before `make brew`
- Sign in to Google Chrome / Firefox
- Sign in to Bitwarden / Proton Pass
- Allow permissions for Karabiner-Elements, Logi Options+, Raycast, AdGuard
- Configure Raycast
- Configure Google Japanese IME
