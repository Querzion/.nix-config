{ config, pkgs, ... }:

{
    # Samba Shares (credentials in hidden files repoository on GitHub)
    fileSystems."/home/querzion/Shares/Gaming" = {
        device = "//192.168.0.3/archive.gaming";
        fsType = "cifs";
        options = [
        "credentials=/home/querzion/.nix-secrets/secrets/samba.cred"
        "uid=1000"
        "gid=1000"
        "rw"
        ];
    };

    fileSystems."/home/querzion/Shares/Data" = {
        device = "//192.168.0.3/archive.data";
        fsType = "cifs";
        options = [
        "credentials=/home/querzion/.nix-secrets/secrets/samba.cred"
        "uid=1000"
        "gid=1000"
        "rw"
        ];
    };

    fileSystems."/home/querzion/Shares/OBS-Studio" = {
        device = "//192.168.0.3/archive.obs-studio";
        fsType = "cifs";
        options = [
        "credentials=/home/querzion/.nix-secrets/secrets/samba.cred"
        "uid=1000"
        "gid=1000"
        "rw"
        ];
    };

    fileSystems."/home/querzion/Shares/Other" = {
        device = "//192.168.0.3/archive.other";
        fsType = "cifs";
        options = [
        "credentials=/home/querzion/.nix-secrets/secrets/samba.cred"
        "uid=1000"
        "gid=1000"
        "rw"
        ];
    };

    fileSystems."/home/querzion/Shares/Work" = {
        device = "//192.168.0.3/archive.work";
        fsType = "cifs";
        options = [
        "credentials=/home/querzion/.nix-secrets/secrets/samba.cred"
        "uid=1000"
        "gid=1000"
        "rw"
        ];
    };

    fileSystems."/home/querzion/Shares/Querzion" = {
        device = "//192.168.0.3/user.querzion";
        fsType = "cifs";
        options = [
        "credentials=/home/querzion/.nix-secrets/secrets/samba.cred"
        "uid=1000"
        "gid=1000"
        "rw"
        ];
    };
}
