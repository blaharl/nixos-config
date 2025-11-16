{ config, pkgs, ... }:

let
  userAliases = {
    fkb="sudo nixos-rebuild boot --flake /home/user/.dotfiles/flake#laptop --impure";
    fkn="sudo nixos-rebuild switch --flake /home/user/.dotfiles/flake#laptop --impure";
    fhb="home-manager boot --flake ~/.dotfiles/flake#laptop --impure";
    fhn="home-manager switch --flake ~/.dotfiles/flake#laptop --impure";
    fku="cd ~/.dotfiles/flake; nix flake update";
  };
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

  programs.bash = {
    shellAliases = userAliases;
  };

  programs.fish = {
    shellAliases = userAliases;
  };

  programs.zsh = {
    shellAliases = userAliases;
  };
}
