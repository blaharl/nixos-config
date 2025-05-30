{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      alsa-utils
      android-tools
      anki
      appimage-run
      dconf2nix
      dualsensectl
      fwupd # sudo fwupdtool security
      home-manager
      keepassxc
      goldendict-ng
      goverlay
      grim
      grimblast # screenshot
      libreoffice
      lm_sensors
      localsend
      logseq
      macchanger
      mangohud 
      megatools
      pavucontrol
      qalculate-qt
      slurp
      xfce.mousepad
    ];
    file = {
      ".config/keepassxc/keepassxc.ini".source = ../file/common/keepassxc_config.ini;
      ".cache/keepassxc/keepassxc.ini".source = ../file/common/keepassxc_cache.ini;
      ".config/goldendict/config".source = ../file/common/goldendict_config;
    };
  };
}
