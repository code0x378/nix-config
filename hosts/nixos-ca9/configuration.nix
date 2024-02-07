{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ../common.nix
    ../../programs/core.nix
    ../../programs/desktop.nix
    ../../programs/gaming.nix
    ../../programs/code.nix
    ../../programs/server.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  # boot.initrd.kernelModules = [ "amdgpu" ];

  networking =
    {
      hostName = "nixos-ca9";
      # interfaces = {
      #   ens33.ipv4.addresses = [{
      #     address = "192.168.10.20";
      #     prefixLength = 32;
      #   }];
      # };
      # defaultGateway = {
      #   address = "192.168.10.254";
      #   interface = "ens33";
      # };
    };

  # Power Management
  powerManagement.cpuFreqGovernor = "performance";

  # Accelerate package building
  nix.settings.max-jobs = 28;

  # X11
  services.xserver.videoDrivers = [ "amdgpu" ];
}
