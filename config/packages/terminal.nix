{ config, pkgs, ... }:

let
  userAliases = {
    ll="lsd -l";
    la="lsd -A";
    l="lsd -lA";
    ".." = "cd ..";

    ase="atuin scripts edit";
    asg="atuin scripts get";
    asl="atuin scripts list";
    asn="atuin scripts new";
    asr="atuin scripts run";

    mdl="megatools dl --choose-files";
    ydl="yt-dlp";
    python="python3";

    vpnon="mullvad connect; sleep 1; mullvad reconnect";
    vpnoff="mullvad disconnect";
    vpnloc="mullvad relay set location $(mullvad relay list | fzf | awk '{print $1}')";
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
      yazi
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

  programs.pay-respects = {
    enable = true;
  };
}
