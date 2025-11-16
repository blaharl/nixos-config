{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      evince
      feh # lightweight image viewer
      ffmpeg
      foliate
      gimp3
      # gnome.eog # image viewer
      gnome-sound-recorder
      img2pdf
      krita
      litemdview # suckless md viewer
      loupe # image viewer
      marktext # md viewer
      mpc
      mpd
      mpdris2
      mpv
      mpvScripts.mpris
      ncmpcpp
      obs-cli
      obs-cmd
      obs-studio
      prismlauncher
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
