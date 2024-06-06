{ config, pkgs, ... }:

{
  # Hardware acceleration
  hardware.opengl = {
    # OpenGL for better performance
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs;
      [
        # intel-media-driver
        # vaapiIntel
        # vaapiVdpau
        # libvdpau-va-gl
      ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    # gzdoom
    steam
    steamcmd
  ];

}
