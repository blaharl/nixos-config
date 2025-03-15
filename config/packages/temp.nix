{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      audacity
      bitcoin
      electrum
      fontconfig
      freetype  # font rendering engine
      # gedit
      inkscape
      # libverto 
      libresprite
      monero-cli
      monero-gui
      # sxhkd # simple X hotkey daemon
      # synergy # share mouse and keyboard between multiple computers
      ttygif
      t-rec
    ];
  };
}
