{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }}:

with pkgs;
mkShell {
  name = "flakeEnv";
  buildInputs = [ nil ];
  shellHook = ''
    alias nrb="sudo nixos-rebuild build --flake ."
    alias nrt="sudo nixos-rebuild test --flake ."
    alias nrs="sudo nixos-rebuild switch --flake ."

    alias build-yoga="nixos-rebuild switch --flake .#cxYoga --use-remote-sudo"
    alias build-thinkpad="nixos-rebuild switch --flake .#cxThinkpad --use-remote-sudo"
    alias build-ca9="nixos-rebuild switch --flake .#cxCoreyann9 --use-remote-sudo"
  '';
}
