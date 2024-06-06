{ config, pkgs, ... }:

{
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.host.package =
    (pkgs.vmware-workstation.overrideAttrs rec {
      src =
        /home/jeff/data/config/nix/binaries/VMware-Workstation-Full-17.5.2.bundle;
      unpackPhase = let
        vmware-unpack-env = pkgs.buildFHSEnv rec {
          name = "vmware-unpack-env";
          targetPkgs = pkgs: [ pkgs.zlib ];
        };
      in ''
        ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${src} --extract unpacked"
      '';
    });
}
