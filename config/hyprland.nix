{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./theme.nix
  ];

  home = {
    packages = with pkgs; [
      thunar
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
      ".config/gtk-3.0/bookmarks".source = ./file/hyprland/gtk-3.0_bookmarks_config;
      ".config/hypr/hyprland.lua".source = ./file/hyprland/hyprland_lua;
    };
    sessionVariables = {
    };
  };

  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    dgop.package = pkgs-unstable.dgop;
  };

  programs.dsearch.enable = true;
}
