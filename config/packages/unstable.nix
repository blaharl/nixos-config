{ config, pkgs-unstable, ... }:

{
  home = {
    packages = with pkgs-unstable; [
      freetube
      ghostty
      gimp3
      logseq
      wikiman
      yazi
      yt-dlp
    ];
  };
}
