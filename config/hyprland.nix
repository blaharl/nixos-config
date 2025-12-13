{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  home = {
    packages = with pkgs; [
      xfce.thunar
      nwg-look

      pyprland

      wev

      aubio
      brightnessctl
      cliphist
      ddcutil
      hyprpicker
      inotify-tools
      libnotify
      jq
      networkmanagerapplet
      (pass-wayland.withExtensions (ext: with ext; [pass-otp]))
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
}
