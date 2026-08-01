{ pkgs, ... }:

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
      newsboat
      # openssl
      qutebrowser
      signal-desktop
      termshark
      tor-browser
      urlscan
      v2ray
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
