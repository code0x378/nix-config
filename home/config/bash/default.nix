{ config, ... }:

{
  home.file.".bash_aliases".source = ./_bash_aliases;
  home.file.".bashrc".source = ./_bashrc;
}
