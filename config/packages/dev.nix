{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # cargo # not compatible with rustup
      gcc
      gdb
      gdbgui # browser based gdb frontend
      gef
      git
      git-filter-repo
      gnumake
      hugo
      lazygit
      luarocks
      # ninja
      nodejs
      postgresql
      python3Full
      R
      rstudio
      rustup # collision with cargo
      sqlite
      # stdenv
      texliveFull
      typst
      uv
    ];
    file = {
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "user";
    userEmail = "user@localhost";
    extraConfig = {
      core = {
        sshCommand = "/usr/bin/env ssh -i /home/user/.ssh/id_github";
      };
    };
  };
}
