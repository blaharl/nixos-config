{ config, pkgs, ... }:

let
  userAliases = {
    openhome="sudo nft -f ~/.dotfiles/scripts/excludeTraffic.rules; sleep 1; mullvad connect; sleep 1; mullvad reconnect; caelestia shell idleInhibitor enable";
  };
in

{
  imports = [
    ./theme.nix
  ];

  home = {
    packages = with pkgs; [
      xfce.thunar
      nwg-look

      wev

      aubio
      brightnessctl
      cliphist
      ddcutil
      hyprpicker
      inotify-tools
      jq
      networkmanagerapplet
      swappy
      wireplumber
      wl-clipboard

      polkit_gnome

    ];
    file = {
      ".config/hypr/hyprland.conf".source = ./file/hyprland/hyprland_hypr_config.conf;
      ".config/gtk-3.0/bookmarks".source = ./file/hyprland/gtk-3.0_bookmarks_config;
    };
    sessionVariables = {
    };
  };

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
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
