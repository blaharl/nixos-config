{ pkgs-unstable, ... }:

{
  home = {
    packages = with pkgs-unstable; [
      concord-tui
      yt-dlp
    ];
  };
}
