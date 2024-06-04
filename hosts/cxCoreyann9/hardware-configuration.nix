# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{

  boot.initrd.availableKernelModules = [ "ata_piix" "mptspi" "uhci_hcd" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/81a019a0-4e33-4ed4-bc3d-71e181a1e851";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/6847da69-84ad-4179-9dd5-4297eca27cc2"; }];

  nixpkgs.hostPlatform = "x86_64-linux";
}
