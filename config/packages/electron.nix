{ pkgs, ... }:

let
  electronArgs = [
    "--gtk-version=4"
    "--wayland-text-input-v3=enabled"
    "--enable-wayland-ime"
  ];
in

{
  home = {
    packages = with pkgs; [
      (ungoogled-chromium.override {
        commandLineArgs = electronArgs;
      })
    ];
  };
}
