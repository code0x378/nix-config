{ inputs
, lib
, config
, pkgs
, ...
}: {
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
#  boot.loader.grub.enable = true;
#  boot.loader.grub.device = "/dev/sda";
#  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#   boot.plymouth.enable = true;
#   boot.plymouth.theme="breeze";

 networking =
   {
     hostName = "cxThinkpad";
#       interfaces = {
#         enp0s31f6.ipv4.addresses = [{
#           address = "192.168.10.10";
#           prefixLength = 32;
#         }];
#       };
#       defaultGateway = {
#         address = "192.168.10.254";
#         interface = "enp0s31f6";
#       };
   };

  # Power Management
  powerManagement.cpuFreqGovernor = "performance";

  # Accelerate package building
  nix.settings.max-jobs = 12;

}
