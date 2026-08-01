{ config, pkgs, ... }:

let
  userAliases = {
    ll = "lsd -l";
    la = "lsd -A";
    l = "lsd -lA";
    ".." = "cd ..";

    q = "exit";
    v = "nvim";
    sv = "sudo nvim";
  };
in

{
  home = {
    packages = with pkgs; [
      bat
      btop
      dash
      fastfetch
      ghostty
      gtop
      html2text
      kitty
      libqalculate
      lsd
      posting
      ripgrep
      ripgrep-all # grep from PDF, E-books, Office docs, zip, tar.gz, ...
      sdcv
      systemctl-tui
      tealdeer
      tidy-viewer # csv pretty printer
      tmux
      tokei
      tree
      wikiman
      zbar
    ];

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
      STARDICT_DATA_DIR = "/home/user/Persistent/Documents/books/dict/stardict/";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = userAliases;
  };

  programs.fish = {
    enable = true;
    shellAliases = userAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = userAliases;
  };

  programs.nushell = {
    enable = true;
    shellAliases = userAliases;
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [ ];
  };

  programs.starship = {
    enable = true;
    settings = {
    };
  };

  programs.zoxide = {
    enable = true;
    options = [ ];
  };

  programs.atuin = {
    enable = true;
    flags = [
      "--disable-up-arrow"
    ];
  };

  programs.carapace = {
    enable = true;
  };

  programs.yazi = {
    shellWrapperName = "y";
    enable = true;
  };

  programs.pay-respects = {
    enable = true;
  };
}
