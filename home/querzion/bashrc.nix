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
        export NIXOS_DOTFILES="~/.nix-config"
        export NIXOS_HOST="myhost"

        # --------------------------
        # NixOS Flake management
        # --------------------------
        alias nos-new='sudo nixos-rebuild switch --flake $NIXOS_DOTFILES#$NIXOS_HOST'
        alias nos-update='nix flake update --flake $NIXOS_DOTFILES'
        alias nos-update-build='nix flake update --flake $NIXOS_DOTFILES && nos-new'
        alias nos-upgrade='sudo nixos-rebuild switch --upgrade --flake $NIXOS_DOTFILES#$NIXOS_HOST'
        alias nos-check='nixos-rebuild build --flake $NIXOS_DOTFILES#$NIXOS_HOST'

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
        # Starship prompt
        # --------------------------
        eval "$(starship init bash)"
        '';
    };
}
