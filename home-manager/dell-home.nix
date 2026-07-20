{...}: {
  imports = [
    ./shared.nix
  ];

  xdg.configFile."niri/config.kdl".source = ../niri/config.kdl;
  # xdg.configFile."quickshell".source = ../quickshell/config.qml;

  home.username = "dell";
  home.homeDirectory = "/home/dell";
}
