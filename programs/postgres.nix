{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all postgres    peer
      local all all    md5
      host all all 127.0.0.1/32   md5
      host all all ::1/128   md5
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      alter user postgres with password 'Smurffdb010';
    '';
    ensureDatabases = [ "synergy" ];
    ensureUsers = [{
      name = "synergy";
      ensureDBOwnership = true;
      ensureClauses = {
        superuser = true;
        createrole = true;
        createdb = true;
      };
    }];
  };
}
