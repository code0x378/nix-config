{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      aspell # Spell checking
      aspellDicts.en # English dictionary
      bash # Gotta have bash
      bash-completion # For bash completion
      bat # Cat but better
      brgenml1cupswrapper # Brother printer drivers
      btop # Like htop but so much better looking
      cmatrix # For fun
      conky # System monitor
      cowsay # Moo
      coreutils # Necessary
      cups # Printing
      curl # For downloading web pages and stuff
      dialog # For scripts
      distrobox # Run another distro under NixOS. Useful for the odd tool not available in Nix yet
      dnsutils # For DNS diagnostics
      dos2unix # For converting files
      eza # ls but better
      fd # Find but better
      feh # Image viewer
      ffmpeg # I deal with a lot of videos
      file # No more asking yourself what file it is, now you can just open a terminal, navigate to the directory, and run a command instead of looking at the file extension
      fortune # For fun
      gotop # Like btop but better
      home-manager # For managing my home directory
      htop # Check system status
      ifuse # For connecting my phone
      imagemagick # Really useful for scripts
      inotify-tools # For watching files
      ipfs # IPFS
      libimobiledevice # For connecting my phone
      libsecret # For passwords
      lm_sensors # For monitoring system sensors
      lynis # Security audits
      lynx # Web browsing
      lshw # Diagnostic time!
      mlocate # Locate files
      neofetch # Everyone loves neofetch
      openssl # For SSL Certificates
      mono # For some programs 
      nettools # For network diagnostics
      nix-index # Locate nix packages
      nix-tree # Check dependencies
      nixfmt # Format Nix files
      nixpkgs-fmt # Format Nix files
      nixos-generators # Generate NixOS outputs from configurations
      nmap # For network debugging
      nmon # For system monitoring
      p7zip # For compressing files
      pciutils # I love diagnosing my system
      ps_mem # (Why is Emacs using so much RAM?)
      pssh # For running commands on multiple servers
      python311Full # Python 3.11
      ranger # File manager
      ripgrep # Like grep but better
      speedtest-cli # Testing my internet speed from the terminal
      smartmontools # Monitor the health of hard drives
      sqlite # Databases and stuff
      tldr # Console cheatsheets 
      tmux # A terminal multiplexer
      tree # For viewing directory trees
      topgrade # Update everything
      trash-cli # Trash instead of delete
      unrar # For unzipping rar archives
      unison # Sync files
      unzip # For unzipping archives
      vim-full # The original (not quite)
      wget # For downloading web pages and stuff
      xterm # Backup terminal
    ];
  };
}
