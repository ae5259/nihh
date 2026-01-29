{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    themeFile = "gruvbox-dark";

    font = {
      name = "Iosevka";
      package = pkgs.iosevka;
    };
  };
}
