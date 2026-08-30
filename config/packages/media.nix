{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      feh # lightweight image viewer
      ffmpeg
      gimp3
      # gnome.eog # image viewer
      gnome-sound-recorder
      img2pdf
      krita
      litemdview # suckless md viewer
      loupe # image viewer
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
      rmpc
      rnote
      sioyek
      wf-recorder
      youtube-tui
      youtube-viewer
    ];
    file = {
    };
  };
}
