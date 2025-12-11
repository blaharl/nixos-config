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
      insomnia
      lazygit
      luarocks
      # ninja
      nodejs
      pgcli
      python312
      R
      rstudio
      rustup # collision with cargo
      sqlite
      # stdenv
      typst
      uv
    ];
    file = {
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "user";
        email = "user@localhost";
      };
      core = {
        sshCommand = "/usr/bin/env ssh -i /home/user/.ssh/id_github";
      };
    };
  };
}
