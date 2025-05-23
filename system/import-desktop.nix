
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

 {
  imports =
    [ # Include the results of the hardware scan.
      ./common/configuration.nix
      ./common/private.nix
      ./common/vm.nix
      ./common/hyprland.nix
      ./common/input/fcitx5.nix
      ./desktop/hardware-configuration.nix
      ./desktop/persistence.nix
      ./desktop/desktop.nix
    ];
}

