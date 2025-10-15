{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        config = {
        user.name = "Slisk Lindqvist";
        user.email = "slisk.lindqvist@querzion.com";
        init.defaultBranch = "main";
        pull.rebase = true;
        };
    };    
}
