{ config, pkgs, ... }:

let
  userAliases = {
    ll="lsd -l";
    la="lsd -A";
    l="lsd -lA";
    ".." = "cd ..";

    asd="atuin scripts delete";
    ase="atuin scripts edit";
    asg="atuin scripts get";
    asl="atuin scripts list";
    asn="atuin scripts new";
    asr="atuin scripts run";

    mdl="megatools dl --choose-files";
    ydl="yt-dlp";

    vpnon="mullvad connect; mullvad reconnect";
    vpnoff="mullvad disconnect";
    vpnloc="~/.dotfiles/scripts/vpnloc.sh";
    wghome="sudo wg-quick up ~/.dotfiles/private/wg_home.conf";
    wgoff="sudo wg-quick down ~/.dotfiles/private/wg_home.conf";

    q="exit";

    v="nvim";
    sv="sudo nvim";

    mdv="litemdview";

    clhist="rm ~/.bash_history; clear; history -c";
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
      kitty
      libqalculate
      lsd
      posting
      ripgrep
      ripgrep-all # grep from PDF, E-books, Office docs, zip, tar.gz, ...
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
      MANPAGER="nvim +Man!";
    };
  };

  programs.neovim = {
      enable = true;
      # extraLuaPackages = ps: [ ps.magick ];
      # extraPackages = [ pkgs.imagemagick ];
      # ... other config
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
    defaultOptions = [];
  };

  programs.starship = {
    enable = true;
    settings = {
    };
  };

  programs.zoxide = {
    enable = true;
    options = [];
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
    enable = true;
  };

  programs.pay-respects = {
    enable = true;
  };
}
