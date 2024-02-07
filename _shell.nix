{ pkgs }:

with pkgs;
mkShell {
  name = "flakeEnv";
  buildInputs = [ nil ];
  shellHook = ''
    alias nrb="nixos-rebuild build --flake ."
    alias nrt="sudo nixos-rebuild test --flake ."
    alias nrs="sudo nixos-rebuild switch --flake ."

    alias build-yoga="nixos-rebuild switch --flake .#yoga --use-remote-sudo"
    alias build-thinkpad="nixos-rebuild switch --flake .#thinkpad --use-remote-sudo"
  '';
}
