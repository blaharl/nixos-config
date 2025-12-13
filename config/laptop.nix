{ config, pkgs, ... }:

let
  username = "user";
in

{
  imports = [
    ./home.nix
    ./packages
    ./hyprland.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "24.05";

    packages = with pkgs; [
      macchanger

      # reaverwps-t6x
      # reaverwps
      bully
      hcxtools
      bettercap
      wirelesstools
      aircrack-ng

      pixiewps
      john
      wordlists
      wifite2
      crunch
      hashcat
      hashcat-utils
    ];

    file = {
    };
    sessionVariables = {
      DEVICE_IS_PC = "0";
      # EDITOR = "emacs";
    };
  };
}
