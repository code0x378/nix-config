{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Jeff Smith";
        email = "jeff@code0x378.com";
      };
    };
  };

  environment =
    {
      systemPackages = with pkgs; [
        alpine # Classic cli emails
        ansible # For managing servers
        aria # For downloading stuff
        arduino # For microcontrollers
        asdf # For managing programming languages
        awscli2 # For managing AWS
        cmake # For compiling C++ programs
        comma # Wrapper for nix-shell and nix-index
        ctags # For generating tags 
        dbeaver-bin # For databases
        black # For formatting Python code
        docker # For running containers
        docker-compose # For running containers but better
        dotnet-sdk_8 # For running C# programs
        dotnet-aspnetcore_8 # For running C# web programs
        elixir # For running Elixir programs
        erlang # For running Erlang programs
        gcc # For compiling C programs
        gh # For managing GitHub
        gitFull # For managing code
        gnumake # For making stuff
        godot_4 # For making games
        go # For running Go programs
        gopls # For Go language server
        google-cloud-sdk # For managing Google Cloud
        inetutils # For networking
        jetbrains-toolbox # For installing JetBrains IDEs
        jdk17 # For running Java programs
        jq # For parsing JSON
        jpegoptim # For optimizing images
        just # Make alternative
#         kdePackages.kdevelop # IDE for C++
        libsecret # For passwords
        mono # For running C# programs
        neovim # The second-best editor. For when Emacs doesn't work
        nodejs # For running JavaScript programs
        nodePackages.live-server # For running a http server
        nodePackages.nodemon # For watching with Node
        nodePackages.prettier # For formatting code
        nodePackages.npm # For managing JavaScript packages
        ollama # For running Ollama programs
        onefetch # For showing off your git repos (like neoFetch but for git)
        pandoc # For converting documents
        pkg-config # For compiling and linking (not sure how useful on nixos)
        pngquant # For optimizing images
        powerline-fonts # For the cool terminal fonts
        powershell # For running PowerShell programs
        python311Full # For running Python programs
        python311Packages.pip # For managing Python packages
        python311Packages.virtualenv # For managing Python environments
        python311Packages.virtualenvwrapper # For managing Python environments
        ruby # For running Ruby programs'
        rustup # Rustup can't be installed via web rustup.sh
        scenic-view # For viewing javafx scenes
        scenebuilder # For building javafx guis
        speedtest-cli # Testing my internet speed from the terminal
        smartmontools # Monitor the health of hard drives
        sqlite # Databases and stuff
        terraform # For managing cloud infrastructure
        terraform-ls # For Terraform language server
        thefuck # For when you mess up a command
        trash-cli # Trash instead of delete
        upx # For compressing binaries 
        unzip # For unzipping archives
        vim # For editing text
        vscode # For when you need a real IDE (or when you're too lazy to open a terminal and run neovim)
        wget # For downloading web pages and stuff
        zsh # The better shell

        # Rust related
        cargo-audit
        cargo-binstall
        cargo-cross
        cargo-edit
        cargo-leptos
        cargo-outdated
        cargo-tauri
        cargo-update
        cargo-watch
        leptosfmt
        trunk

        # Language Servers
       ansible-language-server
       arduino-language-server
       asm-lsp
       cmake-language-server
       crystalline
       csharp-ls
       dockerfile-language-server-nodejs
       elmPackages.elm-language-server
       emmet-language-server
       glas
       golangci-lint-langserver
       gopls
       htmx-lsp
       jdt-language-server
       kotlin-language-server
       luajitPackages.lua-lsp
       marksman
       nimlsp
       nodePackages.bash-language-server
       nodePackages.svelte-language-server
       nodePackages.typescript-language-server
       pylyzer
       tailwindcss-language-server
       terraform-lsp
       vala-language-server
       vim-language-server
       yaml-language-server
      ];
    };

  #   shellAliases = {
  #     # Loads of aliases
  #     ls = "exa";
  #     la = "exa -a";
  #     ll = "exa -la";
  #     lt = "exa -lT";
  #     lat = "exa -laT";

  #     cat = "bat";

  #     rm = "trash";

  #     ta = "tmux attach -t";
  #     tn = "tmux new-session -s";
  #     tl = "tmux list-sessions";

  #     purge = "doas sync; echo 3 | doas tee /proc/sys/vm/drop_caches";

  #   };

  #   variables = {
  #     # Some variables cause variables are cool
  #     EDITOR = "vim";
  #     VISUAL = "vim";
  #     BAT_THEME = "base16";
  #     XDG_CONFIG_HOME = "~/.config";
  #     PATH = "$HOME/.bin/:$PATH";
  #   };
  # };

  # programs.command-not-found.enable = true;

  # programs.zsh = {
  #   # ZSH is cool too
  #   enable = true;
  #   ohMyZsh.enable = true;
  #   autosuggestions.enable = true;
  #   syntaxHighlighting.enable = true;
  # };

  # programs.thefuck.enable = true;
  programs.thefuck.alias = "oh"; # Let's make it a bit more... yeah
}
