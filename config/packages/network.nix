{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      arti
      # chatterino2
      elinks
      element-desktop
      inetutils
      librewolf
      mullvad-browser
      neomutt
      # openssl
      qutebrowser
      termshark
      tor-browser
      v2ray
      vesktop
      w3m
      weechat
      # weechatScripts.weechat-matrix-bridge
      # weechatScripts.weechat-matrix
      wget
      wireshark
    ];

    sessionVariables = {
      BROWSER = "qutebrowser";
    };
  };
}
