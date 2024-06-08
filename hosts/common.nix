{ inputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    overlays = [ ];
    config = { allowUnfree = true; };
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    trusted-users = [ "root" "jeff" "jsmith" ];
    # Avoid unwanted garbage collection when using nix-direnv
    keep-outputs = true;
    keep-derivations = true;
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 4255 24800 ];
      allowedTCPPortRanges = [{
        from = 1714; # KDE Connect
        to = 1764;
      }];
      allowedUDPPorts = config.networking.firewall.allowedTCPPorts;
      allowedUDPPortRanges = config.networking.firewall.allowedTCPPortRanges;
    };

    nameservers = [ "9.9.9.9" "1.1.1.1" ];

    extraHosts = ''
      192.168.10.1 ss1
      192.168.10.2 ss2
    '';
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = false;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Cron
  services.cron.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.brgenml1cupswrapper ];
  };

  # Enable nix index for faster searching
  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the Flatpak package manager.
  services.flatpak.enable = true;

  # Automatic updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # Virtualization
  # virtualisation.vmware.guest.enable = true;
  # virtualisation.vmware.host.enable = true;

  programs = {
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    kdeconnect.enable = true;
  };

  # Enable Docker support
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
      daemon.settings = { bip = "169.254.0.1/16"; };
    };
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
  };

  # Sysctl
  boot.kernel.sysctl = {
    "kernel.pid_max" =
      4194304; # allows a large number of processes and threads to be managed
    "fs.aio-max-nr" =
      1048576; # defines the maximum number of asynchronous I/O requests that can be in progress at a given time.
    "fs.inotify.max_user_watches" =
      524288; # sets the maximum number of file system watches, enhancing file system monitoring capabilities.
  };

  # Reduce swappiness (default 60)
  boot.kernel.sysctl = { "vm.swappiness" = 10;};

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable file search
  services.locate.enable = true;
  services.locate.package = pkgs.mlocate;
  services.locate.localuser = null;

  # Users
  users.users.jeff = {
    isNormalUser = true;
    description = "Jeff Smith";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "uucp"
      "libvirtd"
      "wireshark"
    ];
    initialPassword = "password";
    packages = with pkgs;
      [
        #  thunderbird
      ];
  };
  users.users.jsmith = {
    isNormalUser = true;
    description = "Jeffrey P Smith";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "uucp"
      "libvirtd"
      "wireshark"
    ];
    initialPassword = "password";
    packages = with pkgs;
      [
        #  thunderbird
      ];
  };
  users.users.paulva = {
    isNormalUser = true;
    description = "Paulva Ng";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
      "uucp"
      "libvirtd"
      "wireshark"
    ];
    initialPassword = "password";
    packages = with pkgs;
      [
        #  thunderbird
      ];
  };
  users.extraGroups.vboxusers.members = [ "jeff" "jsmith" ];

  # Fonts need to be installed differently than normal pkgs
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    dina-font
    proggyfonts
    nerdfonts
  ];

  system.stateVersion = "23.11";

}
