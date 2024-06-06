{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ../common.nix
    # ../../home/default.nix
    ../../programs/core.nix
    ../../programs/desktop.nix
    ../../programs/gaming.nix
    ../../programs/code.nix
    ../../programs/server.nix
    ../../programs/postgres.nix
    ../../programs/vmware.nix
    ./hardware-configuration.nix
  ];

  # Bootloader.
  #   boot.loader.grub.enable = true;
  #   boot.loader.grub.device = "/dev/sda";
  #   boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.initrd.kernelModules = [ "amdgpu" ];

  environment = {
    systemPackages = with pkgs; [ calibre apcupsd duplicacy samba4Full ];
  };

  networking = {
    hostName = "cxCoreyann9";
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
  # services.xserver.videoDrivers = [ "amdgpu" ];
}
