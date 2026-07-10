{...}: {
  imports = [
    ./shared.nix
  ];

  xdg.configFile."niri/config.kdl".source = ../niri/config.kdl;

  home.username = "dell";
  home.homeDirectory = "/home/dell";
}
