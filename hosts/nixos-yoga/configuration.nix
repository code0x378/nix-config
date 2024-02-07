{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../common.nix
    ../../home/default.nix
    ../../programs/core.nix
    ../../programs/desktop.nix
    ../../programs/gaming.nix
    ../../programs/code.nix
    ../../programs/server.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-343cf4bc-99ab-4ad2-8450-e7a4860d255e".device = "/dev/disk/by-uuid/343cf4bc-99ab-4ad2-8450-e7a4860d255e";

  networking =
    {
      hostName = "cxYoga";
      #       interfaces = {
      #         ens33.ipv4.addresses = [{
      #           address = "192.168.10.45";
      #           prefixLength = 32;
      #         }];
      #       };
      #       defaultGateway = {
      #         address = "192.168.10.254";
      #         interface = "ens33";
      #       };
    };

  # Power Management
  powerManagement.cpuFreqGovernor = "performance";

  # Accelerate package building
  nix.settings.max-jobs = 12;

}
