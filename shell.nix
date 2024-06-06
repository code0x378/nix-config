{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; } }:

with pkgs;
mkShell {
  name = "flakeEnv";
  buildInputs = [ nil ];
  shellHook = ''
    alias nrb="sudo nixos-rebuild build --flake . --impure"
    alias nrt="sudo nixos-rebuild test --flake . --impure"
    alias nrs="sudo nixos-rebuild switch --flake . --impure"

    alias build-yoga="nixos-rebuild switch --flake .#cxYoga --target-host 192.168.10.46 --build-host 192.168.10.46 --use-remote-sudo"
    alias build-thinkpad="nixos-rebuild switch --flake .#cxThinkpad --target-host 192.168.10.11 --build-host 192.168.10.11 --use-remote-sudo"
    alias build-ca9="nixos-rebuild switch --flake .#cxCoreyann9 --target-host 192.168.10.20 --build-host 192.168.10.20 --use-remote-sudo"

    alias reformat="find -name '*.nix' -print0 | xargs -0 nixfmt"
  '';
}
