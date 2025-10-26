{ pkgs, ... }:

{
    programs.bash = {
        enable = true;
        initExtra = ''
        # --------------------------
        # System Information
        # --------------------------
        fastfetch

        # --------------------------
        # Environment variables
        # --------------------------
        export NIXOS_DOTFILES="~/.nix-config/nixos-unstable"
        export NIXOS_HOST="myhost"
        
        # --------------------------
        # NixOS Flake management
        # --------------------------
        alias nos-new='cd ~/.nix-config/nixos-unstable && sudo nixos-rebuild switch --flake .#myhost'
        alias nos-update='cd ~/.nix-config/nixos-unstable && nix flake update --flake .'
        alias nos-upgrade='cd ~/.nix-config/nixos-unstable && sudo nixos-rebuild switch --upgrade --flake .#myhost'
        alias nos-check='cd ~/.nix-config/nixos-unstable && nixos-rebuild build --flake .#myhost'
        
        # --------------------------
        # Nix Channel Switching STABLE/UNSTABLE
        # --------------------------
        # Check the nix channel from the stable channel
        alias nos-channel-check='cd ~/.nix-config/nixos-25.05/ && sudo nix-channel --list'
        # Switch to unstable system channel
        alias nos-unstable-system='cd ~/.nix-config/nixos-unstable/ && sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos && sudo nix-channel --update && echo "✅ Switched to nixos-unstable"'
        # Switch to stable 25.05 system channel
        alias nos-stable-system='cd ~/.nix-config/nixos-25.05/ && sudo nix-channel --add https://channels.nixos.org/nixos-25.05 nixos && sudo nix-channel --update && echo "✅ Switched to nixos-25.05 (stable)"'

        # --------------------------
        # Git shortcuts
        # --------------------------
        alias gs='git status'
        alias ga='git add'
        alias gc='git commit -v'
        alias gcm='git commit -m'
        alias gp='git push'
        alias gl='git pull --rebase'
        alias gco='git checkout'
        alias gbr='git branch'
        alias gdf='git diff'
        alias gen-gh-key='ssh-keygen -t rsa -b 4096 -C "slisk.lindqvist@querzion.com" -f ~/.ssh/id_rsa_github'
        alias lazy-qc='cd ~/.nix-config && git add . && git commit -F <(git status -s) && git push'


        # --------------------------
        # Docker shortcuts
        # --------------------------
        alias dps='docker ps'
        alias dpa='docker ps -a'
        alias dstop='docker stop'
        alias drm='docker rm'
        alias drmi='docker rmi'
        alias dbuild='docker build -t'
        alias dexec='docker exec -it'

        # --------------------------
        # Nix / Home Manager helpers
        # --------------------------
        alias hn-update='home-manager switch --flake $NIXOS_DOTFILES#$NIXOS_HOST'
        alias hn-upgrade='home-manager switch --upgrade --flake $NIXOS_DOTFILES#$NIXOS_HOST'

        # --------------------------
        # General workflow
        # --------------------------
        alias ls='ls --color=auto -hF'
        alias ll='ls -lah'
        alias grep='grep --color=auto'
        alias df='df -h'
        alias du='du -h'
        alias cls='clear'

        # --------------------------
        # DotNet-EF management (Install/Update dotnet-ef tool)
        # --------------------------
        alias ef-update='
                export PATH="$HOME/.dotnet/tools:$PATH"; \
                dotnet tool install --global dotnet-ef || dotnet tool update --global dotnet-ef; \
                echo "dotnet-ef is installed/updated. Current version: $(dotnet-ef --version)"
            '

        # --------------------------
        # Davinci Resolve - StartUp Commands with OpenCL
        # --------------------------
        alias davre-ricl='OCL_ICD_VENDORS=rusticl.icd davinci-resolve'
        alias davre-rocm='OCL_ICD_VENDORS=amdocl64.icd davinci-resolve'
        alias ch-ricl-ocl='OCL_ICD_VENDORS=rusticl.icd clinfo -l'
        alias ch-ricl='clinfo -l'

        # --------------------------
        # Mailspring (Email-client specific for any session not KDE/GNOME!)
        # --------------------------
        alias mailspring='mailspring --password-store="gnome-libsecret"'
        
        # --------------------------
        # Ownership of the flake.lock file
        # --------------------------
        alias own-flake='sudo chown querzion:users /home/querzion/.nix-config/nixos-unstable/flake.lock'

        # --------------------------
        # WinePrefix 32-bit / 64-bit
        # --------------------------
        alias winetricks32="WINEARCH=win32 WINEPREFIX=$HOME/.local/share/wineprefixes/default32 WINE=/run/current-system/sw/bin/wine WINESERVER=/run/current-system/sw/bin/wineserver winetricks"
        alias winetricks64="WINEARCH=win64 WINEPREFIX=$HOME/.local/share/wineprefixes/default64 WINE=/run/current-system/sw/bin/wine WINESERVER=/run/current-system/sw/bin/wineserver winetricks"


        # --------------------------
        # Starship prompt
        # --------------------------
        eval "$(starship init bash)"
        '';
    };
}
