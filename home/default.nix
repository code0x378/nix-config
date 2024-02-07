{ inputs
, lib
, config
, pkgs
, ...
}: {
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "jeff";
    homeDirectory = "/home/jeff";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Set some user-specific option:w
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "konsole";
  };

  imports = [
    (import ./config/bash { inherit config; })
    (import ./config/git { inherit config pkgs; })
  ];


  home.stateVersion = "23.11";
}
