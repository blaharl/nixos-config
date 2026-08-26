{ config, ... }:

let
  username = "user";
  symlink = config.lib.file.mkOutOfStoreSymlink;
  home_dir = "${config.home.homeDirectory}";
  dotfiles = "${home_dir}/.dotfiles";
in

{
  imports = [
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      ".config/user-dirs.dirs".source = ./file/common/user-dirs_config.dirs;

      "Documents".source = symlink "${home_dir}/Persistent/Documents";
      "Projects".source = symlink "${home_dir}/Persistent/Documents/Projects";
      "Music".source = symlink "${home_dir}/Persistent/Music";
      "Pictures".source = symlink "${home_dir}/Persistent/Pictures";
      "Videos".source = symlink "${home_dir}/Persistent/Videos";
      "shared".source = symlink "${home_dir}/Persistent/shared";
    };

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      "$HOME/.config/emacs/bin"
      "$HOME/.dotfiles/scripts"
      "$HOME/.dotfiles/scripts/aliases"
      "$HOME/.dotfiles/private/scripts"
      "$HOME/go/bin"
    ];
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
