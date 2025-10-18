{ config, pkgs, lib, ... }:

let
  dataDir = "/var/lib/sqlserver/data";
  sqlPassword = "YourStrong@Pass123"; # You might want to parametrize this!
in
{
  systemd.services.docker-sqlserver = {
    description = "Microsoft SQL Server Docker container";
    after = [ "docker.service" "network-online.target" ];
    requires = [ "docker.service" ];

    serviceConfig = {
      ExecStartPre = ''
        echo "Setting ownership and permissions for SQL Server data directory..."
        chown -R 10001:10001 ${dataDir}
        chmod -R 700 ${dataDir}
      '';

      ExecStart = ''
        ${pkgs.docker}/bin/docker run \
          --name sqlserver \
          -e ACCEPT_EULA=Y \
          -e SA_PASSWORD=${sqlPassword} \
          -p 1433:1433 \
          -v ${dataDir}:/var/opt/mssql \
          --restart=always \
          mcr.microsoft.com/mssql/server:2022-latest
      '';

      ExecStop = "${pkgs.docker}/bin/docker stop sqlserver";
      ExecStopPost = "${pkgs.docker}/bin/docker rm sqlserver";
      Restart = "always";

      # Wait for SQL Server to be ready by polling with sqlcmd, timeout after 60 seconds
      ExecStartPost = ''
        echo "Waiting for SQL Server to start..."
        for i in $(seq 1 30); do
          if ${pkgs.docker}/bin/docker exec sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '${sqlPassword}' -Q "SELECT 1" &>/dev/null; then
            echo "SQL Server is up!"
            exit 0
          else
            echo "Waiting for SQL Server... ($i)"
            sleep 2
          fi
        done
        echo "ERROR: SQL Server did not start in time"
        exit 1
      '';
    };

    wantedBy = [ "multi-user.target" ];
  };
}

