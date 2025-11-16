{ config, pkgs, ... }:

{
  imports = [
  ];

  home = {
    packages = with pkgs; [
      # themes
      libsForQt5.qtstyleplugins
      libsForQt5.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      kdePackages.qt6ct
      adwaita-qt
      adwaita-qt6
      adw-gtk3
      catppuccin-qt5ct

      # fonts
      rubik
      # nerdfonts
      nerd-fonts.caskaydia-mono
      nerd-fonts.meslo-lg
      nerd-fonts.terminess-ttf
      nerd-fonts.jetbrains-mono

      # swaycons  Window icons in Sway with Nerd Fonts
    ];
    file = {
    };
    sessionVariables = {
    };

  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      # package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3-dark";
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    # platformTheme.name = "gtk";
    # platformTheme.name = "qtct";
    platformTheme.name = "gtk3";
    style = {
      name = "adwaita-dark";
      # package = pkgs.adwaita-qt;
    };
  };
}
