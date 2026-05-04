{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

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
      (pass-wayland.withExtensions (ext: with ext; [ pass-otp ]))
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

  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    dgop.package = pkgs-unstable.dgop;
  };
}
