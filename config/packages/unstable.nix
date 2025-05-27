{ config, pkgs-unstable, ... }:

{
  home = {
    packages = with pkgs-unstable; [
      freetube
      yt-dlp
    ];
  };
}
