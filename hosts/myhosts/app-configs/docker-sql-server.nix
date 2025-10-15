{ config, pkgs, ... }:

{
    virtualisation.oci-containers.containers.sqlserver = {
        image = "mcr.microsoft.com/mssql/server:2022-latest";

        environment = {
        ACCEPT_EULA = "Y";
        SA_PASSWORD = "YourStrong@Pass123"; # change this to a strong password
        };

        ports = [ "1433:1433" ];

        volumes = [
        "/var/lib/sqlserver/data:/var/opt/mssql"
        ];

        # optional: restart policy to ensure reliability
        extraOptions = [
        "--restart=always"
        ];
    };
}
