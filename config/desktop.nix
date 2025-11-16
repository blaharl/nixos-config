{ config, pkgs, ... }:

let
  userAliases = {
    fkb="sudo nixos-rebuild boot --flake /home/user/.dotfiles/flake#debian --impure";
    fkn="sudo nixos-rebuild switch --flake /home/user/.dotfiles/flake#debian --impure";
    fhb="home-manager boot --flake ~/.dotfiles/flake#debian --impure";
    fhn="home-manager switch --flake ~/.dotfiles/flake#debian --impure";
    fku="cd ~/.dotfiles/flake; nix flake update";

    gd="QT_SCALE_FACTOR=1.5 goldendict & disown";
    kritaa="QT_SCALE_FACTOR=1.3 krita & disown";
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
    ];

    file = {
    };

    sessionVariables = {
      DEVICE_IS_PC = "1";
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
