{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      bitwarden-cli # CLI for bitwarden
      blender # 3D creation suite
      brave # Brave Browser
      cpupower-gui # CPU power management
      distrobox # Distrobox for virtualization
      filezilla # FileZilla FTP Client
      firefox # Firefox
      firefox-devedition-bin # Firefox Developer Edition
      flameshot # Screenshot tool
      geekbench_5 # Geekbench 5 for benchmarking
      gimp # Image editor
      handbrake # HandBrake Video Transcoder
      inkscape # Vector graphics editor
      insync # Insync for Google Drive
      kate # Kate Text Editor
      kdiskmark # Disk benchmarking tool
      krita # Painting tool
      libreoffice # LibreOffice
      #       libsForQt5.bismuth # Window tile manager
      kdePackages.kdenlive # Video editor
      kdePackages.yakuake # Yakuake terminal
      kdePackages.sddm-kcm # Configure sddm without nix
      kdePackages.kcron # Cron config from kde
      kdePackages.kdeplasma-addons # Plasmoids and krunner stuff
      obs-studio # Open Broadcaster Software for streaming
      obsidian
      qbittorrent-qt5 # Torrent client
      qdirstat # Disk usage analyzer
      qemu # QEMU for virtualization
      plymouth # Pretty startup screen
      remmina # Remote Desktop Client
      screenkey # Display key presses on screen
      simplescreenrecorder # Screen recorder
      skypeforlinux # Skype
      stacer # System optimizer
      sublime3 # Sublime Text 3
      synergy # Mouse and keyboard sharing
      tdesktop # Telegram Desktop
      teamviewer # Remote desktop software
      termius # SSH client
      thunderbird # Thunderbird email client
      #       virt-manager-qt # Virtual Machine Manager
      virtualbox # VirtualBox for virtualization
      vivaldi # Vivaldi Browser
      vlc # VLC Media Player
      #       vmware-workstation # VMware Workstation for virtualization
      wayland # Wayland display server
      xrdp # Remote desktop protocol
      xsel # Clipboard manager
      wl-clipboard # Clipboard manager
      zoom-us # Zoom video conferencing
    ];
  };
}
