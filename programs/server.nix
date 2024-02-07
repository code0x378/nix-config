{ config, pkgs, ... }:

{

  environment = {
    systemPackages = with pkgs; [
      nginx # web server
      mariadb_110 # database
      postgresql_16 # database
    ];
  };

}
