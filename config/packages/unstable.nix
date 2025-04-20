{ config, pkgs-unstable, ... }:

{
  home = {
    packages = with pkgs-unstable; [
      freetube
      ghostty
      gimp3
      wikiman
      yazi
      yt-dlp
    ];
  };
}
