{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      devenv
      gcc
      gdb
      gdbgui # browser based gdb frontend
      gef
      git
      git-filter-repo
      github-cli
      gitleaks
      gnumake
      go
      hugo
      insomnia
      jjui
      jujutsu
      lazygit
      luarocks
      # ninja
      nodejs
      pgcli
      python312
      # R
      # rstudio
      rustup
      sqlite
      # stdenv
      trufflehog
      typst
      uv
    ];
    file = {
    };
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [ epkgs.mu4e ];
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "user";
        email = "user@localhost";
      };
      diff = {
        tool = "nvimdiff";
      };
    };
  };
}
