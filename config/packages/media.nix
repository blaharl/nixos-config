{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      cmus
      evince
      feh # lightweight image viewer
      ffmpeg
      foliate
      # gnome.eog # image viewer
      gnome-sound-recorder
      img2pdf
      krita
      litemdview # suckless md viewer
      loupe # image viewer
      marktext # md viewer
      mpv
      obs-cli
      obs-cmd
      obs-studio
      prismlauncher
      quodlibet
      wf-recorder
      yewtube
      youtube-tui
      zettlr # markdown viewer, editor
    ];
    file = {
      ".config/mpv/mpv.conf".source = ../file/common/mpv_config.conf;
    };
  };
}
