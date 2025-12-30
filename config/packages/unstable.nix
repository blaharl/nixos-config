{ config, pkgs-unstable, ... }:

{
  home = {
    packages = with pkgs-unstable; [
      material-symbols
      yt-dlp
    ];
  };
}
