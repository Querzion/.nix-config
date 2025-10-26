{ pkgs, ... }:

{
    # Enable KDE Plasma Home Manager integration
    programs.plasma = {
        enable = true;

        workspace = {
        # Global Look and Feel (overall desktop style)
        lookAndFeel = "org.kde.breezedark.desktop";

        # Color scheme
        colorScheme = "BreezeDark";

        # Icon theme
        iconTheme = "breeze-dark";

        # Cursor theme (Bibata)
        cursorTheme = "Bibata-Modern-Classic";

        # Font configuration
        font = {
            family = "Noto Sans";
            pointSize = 10;
            fixedWidthFamily = "JetBrainsMono Nerd Font";
        };
        };
    };

    ##########################
    # GTK and Font Settings  #
    ##########################
    gtk = {
        enable = true;
        theme.name = "Breeze-Dark";
        iconTheme.name = "breeze-dark";
        cursorTheme.name = "Bibata-Modern-Classic";
    };

    qt = {
        enable = true;
        platformTheme = "kde";
    };

    ##########################
    # Cursor Installation    #
    ##########################
    home.pointerCursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    ##########################
    # Xresources (fallbacks) #
    ##########################
    xresources.properties = {
        "Xcursor.theme" = "Bibata-Modern-Classic";
        "Xcursor.size" = 24;
    };
}