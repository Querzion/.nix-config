# My NixOS Configuration

<!-- ![NixOS Logo](other/nixos-logo.png) -->
<img src="other/nixos-logo.png" alt="NixOS Logo" width="120" height="auto"> 

This repository contains my NixOS system and home-manager configuration, managed declaratively using flakes. It supports modular setups for hosts, desktops, packages, and user environments.

## Quick Start

1. **Clone the repository** to your home directory:

git clone https://github.com/querzion/.nixos.git ~/.nixos
cd ~/.nixos

2. **Update flake dependencies** (pins versions for reproducibility):

nix flake update

3. **Rebuild and switch the NixOS system** (run as root; replace `vmc` if your hostname differs):

sudo nixos-rebuild switch --flake .#vmc

4. **Switch home-manager configuration** for the user `querzion` (or your username):

home-manager switch --flake .#querzion

--
After switching, your system will apply the configurations from `flake.nix`, including all imported modules.

## Structure

- **Root files**: Core configs like `configuration.nix`, `flake.nix`, and system modules (e.g., `boot.nix`, `services.nix`).
- **`hosts/`**: Modular components for desktops (e.g., `cosmic.nix`), packages (e.g., `gaming.nix`), and program configs (e.g., `neovim.nix`).
- **`home/`**: User-specific home-manager setup in `home.nix`.
- **`other/`**: Assets (like the logo), patches, and secrets (gitignore'd).

For a full directory tree, see `folderstructure.txt`.

## Usage Notes

- **Editing**: Use `nix flake check` to validate changes before switching.
- **Multi-host**: Add new host configs under `hosts/` and update `flake.nix` outputs.
- **Secrets**: Use tools like agenix for encrypted secrets (not included yet).
- **Aliases** (add to `~/.bashrc` or equivalent):

alias nr='sudo nixos-rebuild switch --flake ~/.nixos#vmc'
alias hm='home-manager switch --flake ~/.nixos#querzion'

## Contributing

Feel free to fork and adapt! Report issues or PRs welcome.

---

*Built with ❤️ using NixOS 25.05*