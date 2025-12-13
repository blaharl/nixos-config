{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      alsa-utils
      android-tools
      anki
      appimage-run
      bitcoin
      dconf2nix
      dualsensectl
      fwupd # sudo fwupdtool security
      home-manager
      keepassxc
      goldendict-ng
      goverlay
      grim
      inxi
      libreoffice
      lm_sensors
      localsend
      macchanger
      mangohud
      megatools
      monero-cli
      pavucontrol
      slurp
      stow
      xfce.mousepad
    ];
    file = {
      ".config/keepassxc/keepassxc.ini".source = ../file/common/keepassxc_config.ini;
      ".cache/keepassxc/keepassxc.ini".source = ../file/common/keepassxc_cache.ini;
      ".config/goldendict/config".source = ../file/common/goldendict_config;
    };
  };
}
