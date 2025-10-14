# My NixOS Configuration

<img src="other/repo/nixos-logo.png" alt="NixOS Logo" width="120">

This repository contains my NixOS system and home-manager configuration, managed declaratively using flakes. It supports modular setups for hosts, desktops, packages, and user environments.

## Quick Start

1. **Clone the repository** to your home folder:

```bash
git clone https://github.com/querzion/.nix-config ~/.nix-config
cd ~/.nix-config
```
2. Use this flake to rebuild your system and home-manager 
(forces Nix to use these files instead of /etc/nixos/configuration.nix):
```bash
sudo nixos-rebuild switch --flake .#myhost
home-manager switch --flake .#querzion
```
That's it — your system will now use the configurations from this repository.

Built with ❤️ using NixOS 25.05