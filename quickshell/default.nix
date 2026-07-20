{
  pkgs,
  inputs,
  ...
}: {
  programs.quickshell = {
    enable = true;

    package = inputs.quickshell.packages.${pkgs.system}.default;

    configs."main" = {
      source = ./default; # Points to a directory with your QML files
    };
  };
}
