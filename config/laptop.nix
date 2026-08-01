let
  username = "user";
in

{
  imports = [
    ./home.nix
    ./packages
    ./hyprland.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    stateVersion = "24.05";

    file = {
    };
    sessionVariables = {
      DEVICE_IS_PC = "0";
    };
  };
}
