{ config, pkgs, ... }:

let
  userAliases = {
    ll="lsd -l";
    la="lsd -A";
    l="lsd -lA";
    ".." = "cd ..";

    mdl="megatools dl --choose-files";
    ydl="yt-dlp";
    ydls="yt-dlp --write-subs --write-auto-subs --sub-langs \"en.*,ja.*\"";
    chksum="/home/user/.dotfiles/scripts/chksum.sh";
    yloc="/home/user/.dotfiles/scripts/yt-local.sh";
    python="python3";
    shizuku="adb shell /data/app/~~xRLFVsE7GO5RA1EBnl0B1g==/moe.shizuku.privileged.api--lXePlgZQxJGueiHbu5pbw==/lib/arm64/libshizuku.so";

    vpnon="mullvad connect; sleep 1; mullvad reconnect";
    vpnoff="mullvad disconnect";
    vpnloc="mullvad relay set location";
    vpnlist="mullvad relay list | bat";
    vpnq="mullvad relay list | grep";
    wghome="sudo wg-quick up ~/.dotfiles/private/wg_home.conf";
    wgoff="sudo wg-quick down ~/.dotfiles/private/wg_home.conf";

    umu-run="flatpak run --env=GAMEID= --env=WINEPREFIX=/home/user/Persistent/home/shared/umu/PREFIX/ org.openwinecomponents.umu.umu-launcher";

    q="exit";

    v="nvim";
    sv="sudo nvim";

    myip="curl ifconfig.me | awk -F \".\" '{print \$1\".\"\$2\".*.*\"}'";
    myipfull="curl ifconfig.me";

    nixgc="nix-collect-garbage -d; sudo nix-collect-garbage -d";
    nixgc7d="nix-collect-garbage --delete-older-than 7d; sudo nix-collect-garbage --delete-older-than 7d";

    mdv="litemdview";

    clhist="clear && rm ~/.bash_history && history -c";

    ssync="sh /home/user/.dotfiles/private/ssync.sh";
    myssh="sh /home/user/.dotfiles/private/myssh.sh";
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
      glow # cli markdown viewer
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
      tree
      wikiman
      yazi
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

  programs.pay-respects = {
    enable = true;
  };
}
