{ config, pkgs, ... }:

# [ -n $DEVICE_IS_PC ] && echo "1" || echo "0"

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
    ];

    file = {
    };

    sessionVariables = {
      DEVICE_IS_PC = "1";
    };
  };
}
