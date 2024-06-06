{ config, pkgs }:

{
  programs.git = {
    enable = true;
    userName = "Jeff Smith";
    userEmail = "jeff@code0x378.com";
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      f = "fetch";
      m = "merge";
      lg =
        "log --graph --format='%Cred%h%Creset  %<|(15) %C(white)%s %<|(35) %Creset %Cgreen(%cr)%<|(55)  %C(blue)<%an>%Creset%C(yellow)%d%Creset'";
    };
    extraConfig = {
      web = { browser = "${pkgs.firefox}/bin/firefox"; };
      core = { editor = "nvim"; };
      diff = { tool = "meld"; };
      difftool = {
        prompt = false;
        cmd = "${pkgs.meld}/bin/meld $LOCAL $REMOTE";
      };
      merge = { tool = "meld"; };
      mergetool = {
        cmd = "${pkgs.meld}/bin/meld $LOCAL $MERGED $REMOTE";
        keepBackup = false;
      };
    };
  };
}
