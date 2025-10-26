{ config, pkgs, ... }:

{
    # Import KDE Plasma theming configuration for Home Manager
    programs.plasma = {
        enable = true;

        # KDE Plasma global look and feel
        workspace = {
        theme = "Catppuccin-Mocha"; # or Catppuccin-Latte, -Frappe, -Macchiato
        colorScheme = "Catppuccin-Mocha";
        iconTheme = "Papirus-Dark"; # You can swap with Catppuccin icons if installed
        cursorTheme = "Bibata-Modern-Ice"; # Bibata cursor variant
        cursorSize = 24;
        font = {
            name = "Inter";
            size = 10;
        };
        };
    };

    # Ensure required packages for theming are installed
    home.packages = with pkgs; [
        # Cursor theme
        bibata-cursors

        # Catppuccin themes (GTK/Plasma/Icon)
        catppuccin-kde
        catppuccin-gtk
        catppuccin-cursors
        papirus-icon-theme

        # Optional font
        inter
    ];

    # Optional: GTK theme alignment (so apps look consistent)
    gtk = {
        enable = true;
        theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk;
        };
        iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
        };
        cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        };
    };
}
