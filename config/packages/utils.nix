{ pkgs, ... }:

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
      go-ethereum
      home-manager
      keepassxc
      goldendict-ng
      goverlay
      grim
      inxi
      libreoffice
      lm_sensors
      localsend
      lsof
      macchanger
      mangohud
      megatools
      monero-cli
      onlyoffice-desktopeditors
      pavucontrol
      reth
      slurp
      stow
      mousepad
    ];
    file = {
    };
  };
}
