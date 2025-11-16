# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

 {
  users.users.user = {
    hashedPassword = "hashed_password";
  };

  users.users.user.openssh.authorizedKeys.keys = [ "ssh-rsa public_key user" ];

}

