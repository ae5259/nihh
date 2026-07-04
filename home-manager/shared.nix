{inputs, ...}: let
  modules = import ../lib/folder.nix {};
in {
  imports =
    modules.modules
    ++ [
      ../packages/home.nix
      inputs.nix-xl.homeModules.nix-xl
      inputs.zen-browser.homeModules.beta
    ];

  xdg.configFile."niri/config.kdl".source = ../niri/config.kdl;
  # modules = [
  # ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}
