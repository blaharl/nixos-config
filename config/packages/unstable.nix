{ config, pkgs-unstable, ... }:

{
  home = {
    packages = with pkgs-unstable; [
      freetube
      material-symbols
      yt-dlp
    ];
  };
}
