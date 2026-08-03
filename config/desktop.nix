{ pkgs, ... }:

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

    file = {
    };

    sessionVariables = {
      NIXOS_HOST = "debian";
    };
    packages = with pkgs; [
      amdgpu_top
      nvtopPackages.amd
    ];
  };
}
